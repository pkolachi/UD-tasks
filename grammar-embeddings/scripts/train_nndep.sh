#!/bin/bash

STANFORD_CORENLP_DIR="$HOME/Documents/softwares/nlp-tools/language-specific/english/stanford-tools/stanford-corenlp-full-2015-12-09"

ADA_ALPHA=0.01
ADA_EPS=1e-6
BATCH_SIZE=10000
DROP_PROB=0.5
EVAL_ITER=100
HIDDEN_SIZE=200
INIT_RANGE=0.01
MAX_ITER=5
NUM_PRECOMPUTE=100000
REG_PARAM=1e-8
WORD_CUTOFF=1

THREADS=8;
EMBEDDING_FILE=$1;
EMBEDDING_SIZE=$2;
MODEL_PREFIX=$3;
MODEL_NAME="$MODEL_PREFIX-d$EMBEDDING_SIZE-b$WORD_CUTOFF-i$MAX_ITER-model"

CUR_DIR=`dirname $0`
TRAIN_FILE="$CUR_DIR/../data/treebanks/ptb/wsj_lc_num/wsj_02_21.mxtag.conllx.lc_num"
DEV_FILE="$CUR_DIR/../data/treebanks/ptb/wsj_lc_num/wsj_22.mxtag.conllx.lc_num"

java -Xmx20G -cp "$STANFORD_CORENLP_DIR/*" \
    edu.stanford.nlp.parser.nndep.DependencyParser \
    -trainFile $TRAIN_FILE \
    -devFile $DEV_FILE \
    -embedFile $EMBEDDING_FILE \
    -embeddingSize $EMBEDDING_SIZE \
    -model "$MODEL_NAME.txt.gz" \
    -adaAlpha $ADA_ALPHA \
    -adaEps $ADA_EPS \
    -batchSize $BATCH_SIZE \
    -dropProb $DROP_PROB \
    -evalPerIter $EVAL_ITER \
    -hiddenSize $HIDDEN_SIZE \
    -initRange $INIT_RANGE \
    -maxIter $MAX_ITER \
    -numPreComputer $NUM_PRECOMPUTE \
    -regParameter $REG_PARAM \
    -trainingThreads $THREADS \
    -wordCutOff $WORD_CUTOFF \
    > "$MODEL_NAME.log"  2>&1 

