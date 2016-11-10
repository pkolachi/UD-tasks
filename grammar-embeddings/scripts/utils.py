#!/usr/bin/env python

from __future__ import print_function, division;
from globalimports import *;
import random_utils as ru;
import conll_utils as cu; 

import re;

TAGGEDFILE_FIELDS = ('id', 'form', 'udpostag', 'pennpostag', );

def replace_token(form):
  form = form.lower();
  num_pat = re.compile('[0-9]+([.:,-/][0-9]+)*', re.U);
  form = re.sub(num_pat, 'NUMBER', form);
  return form;

def updateTags(args):
  oldsent, newsent = args;
  assert(len(oldsent) == len(newsent));
  return [
          defaultdict(lambda: '_',
          {
           'id': oldedge['id'], 
           'form': oldedge['form'], 
           'cpostag': oldedge['cpostag'], 
           'postag': newedge['postag']
          }
          ) 
          for oldedge, newedge in zip(oldsent, newsent)
         ];

def unigram_freqs(taggedfile, unigramsfile=''):
  global TAGGEDFILE_FIELDS;
  FIELDS = TAGGEDFILE_FIELDS;
  orig_sents = cu.sentences_from_conll(ru.lines_from_file(taggedfile), fields=FIELDS);
  word_forms = (replace_token(edge['form']) for sent in orig_sents for edge in sent);
  freqs = defaultdict(int);
  for word in word_forms:
    freqs[word] += 1;
  freqs = ("%s\t%s" %(word, freq) for word, freq in sorted(freqs.iteritems(), key=itemgetter(1), reverse=True));
  ru.lines_to_file(unigramsfile, freqs);
  return;

def get_lexiconfile(taggedfile, lexiconfile='', poskeys='', windowsize=0):
  global TAGGEDFILE_FIELDS;
  FIELDS = TAGGEDFILE_FIELDS;
  orig_sents = cu.sentences_from_conll(ru.lines_from_file(taggedfile), fields=FIELDS);
  
  if poskeys == '': 
    pos_key = (FIELDS.index('udpostag'), );  # assume the default scenario to be UD tags
  else:
    pos_key = tuple(FIELDS.index(key.strip()) for key in poskeys.split(','));
  
  mod_sents = ([(replace_token(sent[idx]['form']), "+".join(sent[idx][FIELDS[key]] for key in pos_key)) for idx in range(len(sent))] for sent in orig_sents);
  mod_sents = ([('BOS', 'BOS')]*windowsize+sent+[('EOS', 'EOS')]*windowsize for sent in mod_sents);
  #word_tags = ((sent[idx][0], '_'.join('%d:%s' %(i, sent[idx+i][1]) for i in range(-windowsize, windowsize+1))) for sent in mod_sents for idx in range(windowsize, len(sent)-windowsize));
  word_tags = ((sent[idx][0], '_'.join('%s' %(sent[idx+i][1]) for i in range(-windowsize, windowsize+1))) for sent in mod_sents for idx in range(windowsize, len(sent)-windowsize));
  
  freqs = defaultdict(int);
  forms_hash = defaultdict(lambda: counter().next);
  tags_hash  = defaultdict(lambda: counter().next);
  for word, tag in word_tags:
    freqs[(forms_hash[word], tags_hash[tag])] += 1;

  inv_forms_hash = dict((wordidx, word) for word, wordidx in forms_hash.items());
  inv_tags_hash  = dict((wordidx, word) for word, wordidx in tags_hash.items());
  freqs = ("%d\t%s\t%s" %(freq, inv_forms_hash[word[0]], inv_tags_hash[word[1]]) for word, freq in sorted(freqs.iteritems(), key=itemgetter(1), reverse=True));
  ru.lines_to_file(lexiconfile, freqs);
  return;

def emission_matrix(lexiconfile, threshold=10, matrixfile=''):
  entries = ru.lines_from_file(lexiconfile);
  entries = map(lambda X: X.split('\t'), entries);
  entries = filter(lambda X: len(X) == 3, entries);
  entries = ((word, tag, int(count)) for count, word, tag in entries);
  #entries = [(replace_token(word), tag, count) for word, tag, count in entries];
  forms_hash = defaultdict(lambda: counter().next);
  tags_hash  = defaultdict(lambda: counter().next);
  word_freqs = defaultdict(int);
  wordtag_freqs = defaultdict(int);
  for word, tag, count in entries:
    word_freqs[forms_hash[word]] += count;
    wordtag_freqs[(forms_hash[word], tags_hash[tag])] += count;
  filtered_vcb = filter(lambda X: X[1] >= threshold, word_freqs.items());
  filtered_vcb = dict(filtered_vcb);
  emission_matrix = ((word, tag, wordtag_freqs[(word, tag)]/word_freqs[word]) for word, tag in wordtag_freqs if word in filtered_vcb);
  #print("Vcb-size: %d\tFil.Vcb-size: %d\tEmi-size: %d" \
  #    %(len(entries), len(filtered_vcb), len(emission_matrix)), file=stderr);
  inv_forms_hash = dict((wordidx, word) for word, wordidx in forms_hash.items());
  inv_tags_hash  = dict((wordidx, word) for word, wordidx in tags_hash.items());
  emission_matrix = (u"{0}\t{1}\t{2}".format(inv_forms_hash[word], inv_tags_hash[tag], prob) for word, tag, prob in sorted(emission_matrix, key=lambda (wi, ti, p): (inv_forms_hash[wi], inv_tags_hash[ti], p)));
  ru.lines_to_file(matrixfile, emission_matrix);
  return;

def preprocess_treebanks(conllfile, outconllfile):
  def lc_num(conll_sent):
    return map(lambda X: dict(X.items()+[('form', replace_token(X['form']))]),
      conll_sent);

  inputStream = ru.lines_from_file(conllfile);
  cu.FIELDS = cu.CONLL07_COLUMNS;
  conll_sents = cu.sentences_from_conll(inputStream);
  mod_conll_sents = map(lc_num, conll_sents);
  ru.lines_to_file(outconllfile, cu.sentences_to_conll07(mod_conll_sents));
  return;

def add_tags(conllfile, taggedfile):
  FIELDS1   = cu.CONLL07_COLUMNS;
  FIELDS2   = ('form', 'postag', );
  cu.FIELDS = ('id', 'form', 'cpostag', 'postag', );

  orig_sents = cu.sentences_from_conll(ru.lines_from_file(conllfile), fields=FIELDS1);
  tag_sents  = cu.sentences_from_conll(ru.lines_from_file(taggedfile), fields=FIELDS2);
  new_sents  = map(updateTags, zip(orig_sents, tag_sents));
  ru.lines_to_file("", cu.sentences_to_conll(new_sents));
  return;

if __name__ == '__main__':
  #unigram_freqs(sysargv[1], sysargv[2]);
  '''
  get_lexiconfile(
      sysargv[1], 
      lexiconfile=(sysargv[2] if len(sysargv) > 2 else ''), 
      poskeys=(sysargv[3] if len(sysargv) > 3 else ''), 
      windowsize=(int(sysargv[4]) if len(sysargv) > 4 else 0)
      );
  '''
  emission_matrix(sysargv[1], matrixfile=sysargv[2], threshold=int(sysargv[3]));
  #preprocess_treebanks(sysargv[1], sysargv[2]);
  #add_tags(sysargv[1], sysargv[2]);
  sysexit(0);
