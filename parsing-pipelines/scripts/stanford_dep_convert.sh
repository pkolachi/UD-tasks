#!/bin/bash

#STANFORD_CORENLP_DIR="$HOME/Documents/softwares/nlp-tools/language-specific/english/stanford-tools/stanford-corenlp-full-2015-04-20"
STANFORD_CORENLP_DIR="$HOME/Documents/softwares/nlp-tools/language-specific/english/stanford-tools/stanford-corenlp-full-2015-12-09"

java -cp "$STANFORD_CORENLP_DIR/*:" edu.stanford.nlp.trees.EnglishGrammaticalStructure -threads 4 -treeFile $1 -basic -keepPunct -conllx
