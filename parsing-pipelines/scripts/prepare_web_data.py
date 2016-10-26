
import codecs, os.path, sys;
from collections import defaultdict;
from itertools import chain, imap;
import conll_utils, random_utils;

sys.stdout = codecs.getwriter('utf-8')(sys.stdout);
sys.stdin  = codecs.getreader('utf-8')(sys.stdin)  ;

def conll_to_tagged():
  tagged = lambda conll_sent: ' '.join('%s%s%s' %(edge['form'], delim, edge['cpostag']) for edge in conll_sent);
  onlyforms = lambda conll_sent: ' '.join('%s' %(edge['form']) for edge in conll_sent);
  print '\n'.join(imap(tagged, conll_utils.sentences_from_conll(sys.stdin)));
  return;

def tagged_to_conll():
  conll_sentences = [];
  delim = '/';
  for sentence in sys.stdin:
    tokens = re.split('\s+', sentence.strip());
    conll_sent = [];
    for tokidx, tok in enumerate(tokens, start=1):
      tok, tag = tok.rsplit(delim, 1);
      edge = {'id': tokidx, 'form': tok, 'cpostag': tag};
      conll_sent.append(edge);
    conll_sentences.append(conll_sent);
  conll_utils.sentences_to_conll07(sys.stdout, conll_sentences);
  return;

def strip_everything_except_pos():
  with random_utils.smart_open(sys.argv[1]) as infile, random_utils.smart_open(sys.argv[2], 'w') as outfile:
    preprocessed_sentences = [];
    for sentence in conll_utils.sentences_from_conll(infile, comments=True):
      preprocessed_sentences.append([dict([('id', edge['id']), ('form', edge['form']), ('cpostag', edge['cpostag']), ('postag', edge['cpostag']), ('head', edge['head']), ('deprel', edge['deprel'])]) for edge in sentence]);
      #preprocessed_sentences.append([dict([('id', edge['id']), ('form', edge['form']), ('cpostag', edge['postag']), ('postag', edge['postag']), ('head', edge['head']), ('deprel', edge['deprel'])]) for edge in sentence]);  # --for Hindi dataset;
    conll_utils.sentences_to_conll09(outfile, preprocessed_sentences);
  return;

def conll07toconll09():
  replicatePosTags = lambda X: [dict(e.items()+[('ppostag', e['cpostag'])]) for e in X]
  with random_utils.smart_open(sys.argv[1]) as infile, random_utils.smart_open(sys.argv[2], 'w') as outfile:
    conll_utils.FIELDS = conll_utils.CONLL07_COLUMNS;
    conll_utils.sentences_to_conll09(outfile, imap(replicatePosTags, conll_utils.sentences_from_conll(infile)));
  return;

def conll09toconll07():
  '''
  replicatePosTagsForGold = lambda X: [dict(filter(lambda x: x[0] not in ['plemma', 'ppostag', 'pfeats', 'phead', 'pdeprel'], e.items())+[('cpostag', e['postag']), ('postag', e['postag'])]) for e in X]
  replicatePosTags        = lambda X: [dict(filter(lambda x: x[0] not in ['plemma', 'ppostag', 'pfeats', 'phead', 'pdeprel'], e.items())+\
      [('lemma', e['lemma']), ('cpostag', e['ppostag']), ('postag', e['ppostag']), ('feats', e['pfeats']), ('head', e['phead']), ('deprel', e['pdeprel'])]) for e in X]
  #replicatePosTags        = lambda X: [dict(filter(lambda x: x[0] not in ['plemma', 'ppostag', 'pfeats', 'phead', 'pdeprel'], e.items())+\
  #    [('lemma', e['plemma']), ('cpostag', e['ppostag']), ('postag', e['ppostag']), ('feats', e['pfeats']), ('head', e['phead']), ('deprel', e['pdeprel'])]) for e in X]
  
  if len(sys.argv) > 2:
    gold=True;
    replicatePosTags = replicatePosTagsForGold;
  ''' # -- in future this function has to be changed as above. For the oov-parsing project: 

  replicateBlindPosTags  = lambda X: [dict([('id', e['id']), ('form', e['form']), ('lemma', e['lemma']), ('cpostag', e['ppostag']), ('postag', e['ppostag'])]) for e in X]
  replicateGoldPosTags   = lambda X: [dict(filter(lambda x: x[0] not in ['postag', 'phead', 'pdeprel'], e.items())+[('cpostag', e['postag']), ('postag', e['postag'])]) for e in X]
  replicatePosTags       = lambda X: [dict(filter(lambda x: x[0] not in ['postag', 'phead', 'pdeprel'], e.items())+[('cpostag', e['ppostag']), ('postag', e['ppostag'])]) for e in X]
  replicateSystemPosTags = lambda X: [dict(filter(lambda x: x[0] not in ['postag', 'phead', 'pdeprel'], e.items())+[('cpostag', e['ppostag']), ('postag', e['ppostag']), ('head', e['phead']), ('deprel', e['pdeprel'])]) for e in X]
  
  if len(sys.argv) > 3 and sys.argv[3] == 'system':
    replicatePosTags = replicateSystemPosTags;
  elif len(sys.argv) > 3 and sys.argv[3] == 'blind':
    replicatePosTags = replicateBlindPosTags;
  elif len(sys.argv) > 3 and sys.argv[3] == 'gold':
    replicatePosTags = replicateGoldPosTags;
  with random_utils.smart_open(sys.argv[1]) as infile, random_utils.smart_open(sys.argv[2], 'w') as outfile:
    conll_utils.FIELDS = conll_utils.CONLL09_COLUMNS;
    conll_utils.sentences_to_conll07(outfile, imap(replicatePosTags, conll_utils.sentences_from_conll(infile)));
  return;

def jackknifing():
  conllfile = sys.argv[1];
  outdir = sys.argv[2];
  folds = int(sys.argv[3]); 
  
  import os;
  if not os.path.isdir(outdir):
    os.makedirs(outdir);
  with random_utils.smart_open(conllfile) as infile:
    conll_utils.FIELDS = conll_utils.CONLL09_COLUMNS;
    sentences_hash = dict((idx, sentence) for idx, sentence in enumerate(conll_utils.sentences_from_conll(infile)));
    fold_indices = dict((i, i%folds) for i in xrange(len(sentences_hash))); 
    fold_splits = defaultdict(list);
    [fold_splits[v].append(k) for k,v in fold_indices.iteritems()];
    foldlen = len(str(folds));
    for fold_idx in fold_splits:
      filename, fileext = os.path.splitext(os.path.split(conllfile)[1]);
      outfilepath  = os.path.join(outdir, '%s-split%s%s' %(filename, str(fold_idx+1).zfill(foldlen), fileext));
      outfilepath2 = os.path.join(outdir, '%s-rest%s%s'  %(filename, str(fold_idx+1).zfill(foldlen), fileext));
      with random_utils.smart_open(outfilepath, 'w') as outfile:
        conll_utils.sentences_to_conll09(outfile, (sentences_hash[idx] for idx in sorted(fold_splits[fold_idx])));
      with random_utils.smart_open(outfilepath2, 'w') as outfile:
        sids = chain.from_iterable(fold_splits[idx] for idx in fold_splits if idx != fold_idx);
        conll_utils.sentences_to_conll09(outfile, (sentences_hash[idx] for idx in sorted(sids)));
  return;

def reorder_cross_validated_sentences():
  ''' 
    This function is necessary to shuffle conll sentences to restore the original order; 
    this happens because the cross-validation in preparing pos tagged treebanks, shuffles the sentences;
  '''
  original_conllfile = sys.argv[1];
  shuffled_conllfile = sys.argv[2];
  
  ordering_map  = {};
  sentences_buf = {};
  sentences_hash = defaultdict(list);
  with random_utils.smart_open(original_conllfile) as infile:
    conll_utils.FIELDS = conll_utils.CONLL09_COLUMNS;
    for idx, sentence in enumerate(conll_utils.sentences_from_conll(infile)):
      sentences_hash[' '.join('%s|%s|%s|%s' %(edge['form'], edge['postag'], edge['head'], edge['deprel']) for edge in sentence)].append(idx);
  print >>sys.stderr, len(sentences_hash), max(sentences_hash.values());
  #assert(len(sentences_hash) == max(sentences_hash.values())+1);
  with random_utils.smart_open(shuffled_conllfile) as infile2:
    for idx, sentence in enumerate(conll_utils.sentences_from_conll(infile2)):
      tok_sent = ' '.join('%s|%s|%s|%s' %(edge['form'], edge['postag'], edge['head'], edge['deprel']) for edge in sentence);
      if tok_sent not in sentences_hash:
        # something is terribly wrong; 
        sys.exit(1);
        pass;
      for idx in sentences_hash[tok_sent]:
        ordering_map[idx] = sentence;
    conll_utils.sentences_to_conll09(sys.stdout, (ordering_map[idx] for idx in sorted(ordering_map.keys())));
  return;

def split_conll():
  original_conllfile = sys.argv[1];
  if original_conllfile.endswith('.gz') or original_conllfile.endswith('.bz2'):
    conllfilename, cext = os.path.splitext(original_conllfile);
  output_prefix, ext = os.path.splitext(conllfilename);
  
  import itertools;
  splits = 20;
  sent_count = sum(imap(lambda x: 0 if x else 1, random_utils.lines_from_file(original_conllfile)));
  split_size = sent_count/splits+1;
  
  with random_utils.smart_open(original_conllfile) as infile:
    conll_utils.FIELDS = conll_utils.CONLL09_COLUMNS;
    foldlen = len(str(splits));
    conll_sents = (sentence for sentence in conll_utils.sentences_from_conll(infile));
    for foldidx in xrange(splits):
      outfilepath  = '%s-split%s%s%s' %(output_prefix, str(foldidx+1).zfill(foldlen), ext, cext);
      with random_utils.smart_open(outfilepath, 'w') as outfile:
        try:
          conll_utils.sentences_to_conll09(outfile, (conll_sents.next() for idx in xrange(split_size)));
        except StopIteration:
          pass;
  return;
	
if __name__ == '__main__':
  #conll_to_tagged();
  #tagged_to_conll();
  #strip_everything_except_pos();
  #conll07toconll09();
  conll09toconll07();
  #jackknifing();
  #reorder_cross_validated_sentences();
  #split_conll();
