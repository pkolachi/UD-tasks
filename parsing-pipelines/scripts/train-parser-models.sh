export MATETOOLS_JAR="$HOME/Documents/softwares/nlp-tools/parsers/mate-tools/anna-3.61.jar"
export EXP_DIR="$HOME/Documents/chalmers-work/gf-parsing/ud-parsing/v1.1"
#
#java -Xmx12g -classpath $MATETOOLS_JAR is2.parser.Parser \
#    -train $EXP_DIR/sv/preprocessed-web-data/sv-ud-train-matetagged.conll09 \
#    -test  $EXP_DIR/sv/pos-tagger/mate-tools/sv-ud-dev-udweb_tagged.conll09 \
#    -eval  $EXP_DIR/sv/preprocessed-web-data/sv-ud-dev.conll09 \
#    -out   $EXP_DIR/sv/full-models/web_model/sv-ud-dev-gmateparsedth0_3.conll09 \
#    -model $EXP_DIR/sv/full-models/web_model/sv-ud-web.mdl \
#    -i 20 -hsize 500000001 -cores 8 \
#    -decodeTH 0.3
#
java -Xmx12g -classpath $MATETOOLS_JAR is2.parser.Parser \
    -train $EXP_DIR/fi/preprocessed-web-data/fi-ud-train-matetagged.conll09 \
    -test  $EXP_DIR/fi/pos-tagger/mate-tools/fi-ud-dev-udweb_tagged.conll09 \
    -eval  $EXP_DIR/fi/preprocessed-web-data/fi-ud-dev.conll09 \
    -out   $EXP_DIR/fi/full-models/web_model/fi-ud-dev-gmateparsedth0_3.conll09 \
    -model $EXP_DIR/fi/full-models/web_model/fi-ud-web.mdl \
    -i 20 -hsize 500000001 -cores 1 \
    -decodeTH 0.3
#
#java -Xmx12g -classpath $MATETOOLS_JAR is2.parser.Parser \
#    -train $EXP_DIR/de/preprocessed-web-data/de-ud-train-matetagged.conll09 \
#    -test  $EXP_DIR/de/pos-tagger/mate-tools/de-ud-dev-udweb_tagged.conll09 \
#    -eval  $EXP_DIR/de/preprocessed-web-data/de-ud-dev.conll09 \
#    -out   $EXP_DIR/de/full-models/web_model/de-ud-dev-gmateparsedth0_3.conll09 \
#    -model $EXP_DIR/de/full-models/web_model/de-ud-web.mdl \
#    -i 20 -hsize 500000001 -cores 8 \
#    -decodeTH 0.3
#
#java -Xmx12g -classpath $MATETOOLS_JAR is2.parser.Parser \
#    -train $EXP_DIR/fr/preprocessed-web-data/fr-ud-train-matetagged.conll09 \
#    -test  $EXP_DIR/fr/pos-tagger/mate-tools/fr-ud-dev-udweb_tagged.conll09 \
#    -eval  $EXP_DIR/fr/preprocessed-web-data/fr-ud-dev.conll09 \
#    -out   $EXP_DIR/fr/full-models/web_model/fr-ud-dev-gmateparsedth0_3.conll09 \
#    -model $EXP_DIR/fr/full-models/web_model/fr-ud-web.mdl \
#    -i 20 -hsize 500000001 -cores 8 \
#    -decodeTH 0.3
#
#java -Xmx12g -classpath $MATETOOLS_JAR is2.parser.Parser \
#    -train $EXP_DIR/es/preprocessed-web-data/es-ud-train-matetagged.conll09 \
#    -test  $EXP_DIR/es/pos-tagger/mate-tools/es-ud-dev-udweb_tagged.conll09 \
#    -eval  $EXP_DIR/es/preprocessed-web-data/es-ud-dev.conll09 \
#    -out   $EXP_DIR/es/full-models/web_model/es-ud-dev-gmateparsedth0_3.conll09 \
#    -model $EXP_DIR/es/full-models/web_model/es-ud-web.mdl \
#    -i 20 -hsize 500000001 -cores 8 \
#    -decodeTH 0.3
#
#java -Xmx12g -classpath $MATETOOLS_JAR is2.parser.Parser \
#    -train $EXP_DIR/it/preprocessed-web-data/it-ud-train-matetagged.conll09 \
#    -test  $EXP_DIR/it/pos-tagger/mate-tools/it-ud-dev-udweb_tagged.conll09 \
#    -eval  $EXP_DIR/it/preprocessed-web-data/it-ud-dev.conll09 \
#    -out   $EXP_DIR/it/full-models/web_model/it-ud-dev-gmateparsedth0_3.conll09 \
#    -model $EXP_DIR/it/full-models/web_model/it-ud-web.mdl \
#    -i 20 -hsize 500000001 -cores 8 \
#    -decodeTH 0.3
#
#java -Xmx12g -classpath $MATETOOLS_JAR is2.parser.Parser \
#    -train $EXP_DIR/bl/preprocessed-web-data/bg-ud-train-matetagged.conll09 \
#    -test  $EXP_DIR/bl/pos-tagger/mate-tools/bg-ud-dev-udweb_tagged.conll09 \
#    -eval  $EXP_DIR/bl/preprocessed-web-data/bg-ud-dev.conll09 \
#    -out   $EXP_DIR/bl/full-models/web_model/bg-ud-dev-gmateparsedth0_3.conll09 \
#    -model $EXP_DIR/bl/full-models/web_model/bg-ud-web.mdl \
#    -i 20 -hsize 500000001 -cores 8 \
#    -decodeTH 0.3
#
#java -Xmx12g -classpath $MATETOOLS_JAR is2.parser.Parser \
#    -train $EXP_DIR/gr/preprocessed-web-data/el-ud-train-matetagged.conll09 \
#    -test  $EXP_DIR/gr/pos-tagger/mate-tools/el-ud-dev-udweb_tagged.conll09 \
#    -eval  $EXP_DIR/gr/preprocessed-web-data/el-ud-dev.conll09 \
#    -out   $EXP_DIR/gr/full-models/web_model/el-ud-dev-gmateparsedth0_3.conll09 \
#    -model $EXP_DIR/gr/full-models/web_model/el-ud-web.mdl \
#    -i 20 -hsize 500000001 -cores 8 \
#    -decodeTH 0.3
#
#java -Xmx12g -classpath $MATETOOLS_JAR is2.parser.Parser \
#    -train $EXP_DIR/da/preprocessed-web-data/da-ud-train-matetagged.conll09 \
#    -test  $EXP_DIR/da/pos-tagger/mate-tools/da-ud-dev-udweb_tagged.conll09 \
#    -eval  $EXP_DIR/da/preprocessed-web-data/da-ud-dev.conll09 \
#    -out   $EXP_DIR/da/full-models/web_model/da-ud-dev-gmateparsedth0_3.conll09 \
#    -model $EXP_DIR/da/full-models/web_model/da-ud-web.mdl \
#    -i 20 -hsize 500000001 -cores 8 \
#    -decodeTH 0.3
#
