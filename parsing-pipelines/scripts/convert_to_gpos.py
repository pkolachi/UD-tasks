#!/usr/bin/env python

from globalimports import *;
import conll_utils;
import random_utils;

def read_mapping(mapfile):
  map_tags = {};
  with random_utils.smart_open(mapfile) as infile:
    for line in infile:
      line = line.strip();
      #fine, coarse = line.split('\t');
      coarse, fine = line.split('\t');
      fine = (fine, ) if fine.find('|') == -1 else tuple(fine.split('|'));
      map_tags[fine] = coarse;
  return map_tags;            

def convert_tags(conll_sentence, mapping=None):
  global map_tag;
  mapping = map_tag;
  coarse_sequence = [];
  for token in conll_sentence:
    token['cpostag'] = mapping.get((token['postag'],), '_UNK_') if token['postag'] != '_' else mapping.get((token['cpostag'],), '_UNK_');
  return conll_sentence;

map_tag = {};

def main():
  if len(sysargv) < 2:
    print >>stderr, "./%s <map-file>" %(sysargv[0]);
    return;
  global map_tag;
  map_tag = read_mapping(sysargv[1]);
  inputFileName  = sysargv[2] if len(sysargv) >= 3 else '';
  outputFileName = sysargv[3] if len(sysargv) >= 4 else '';
  with random_utils.smart_open(inputFileName) as infile, random_utils.smart_open(outputFileName, 'wb') as outfile:
    conll_utils.sentences_to_conll07(outputFile, imap(convert_tags, conll_utils.sentences_from_conll(inputFile)));
  return;

if __name__ == '__main__':
  main();
