export MATETOOLS_JAR="$HOME/Documents/softwares/nlp-tools/parsers/mate-tools/anna-3.61.jar"
export EXP_DIR="$HOME/Documents/chalmers-work/gf-parsing/ud-parsing/v1.2"

java -Xmx12g -classpath $MATETOOLS_JAR is2.tag.Tagger \
    -train $EXP_DIR/ar/preprocessed-web-data/ar-ud-train.conll09 \
    -model $EXP_DIR/ar/pos-tagger/mate-tools/ar-ud-web.mdl \
    -test  $EXP_DIR/ar/preprocessed-web-data/ar-ud-dev.conll09 \
    -eval  $EXP_DIR/ar/preprocessed-web-data/ar-ud-dev.conll09 \
    -out   $EXP_DIR/ar/pos-tagger/mate-tools/ar-ud-dev-udweb_tagged.conll09 \
    -i 10 -cores 4 -hsize 90000001

java -Xmx12g -classpath $MATETOOLS_JAR is2.tag.Tagger \
    -train $EXP_DIR/bl/preprocessed-web-data/bg-ud-train.conll09 \
    -model $EXP_DIR/bl/pos-tagger/mate-tools/bg-ud-web.mdl \
    -test  $EXP_DIR/bl/preprocessed-web-data/bg-ud-dev.conll09 \
    -eval  $EXP_DIR/bl/preprocessed-web-data/bg-ud-dev.conll09 \
    -out   $EXP_DIR/bl/pos-tagger/mate-tools/bg-ud-dev-udweb_tagged.conll09 \
    -i 10 -cores 4 -hsize 90000001

java -Xmx12g -classpath $MATETOOLS_JAR is2.tag.Tagger \
    -train $EXP_DIR/da/preprocessed-web-data/da-ud-train.conll09 \
    -model $EXP_DIR/da/pos-tagger/mate-tools/da-ud-web.mdl \
    -test  $EXP_DIR/da/preprocessed-web-data/da-ud-dev.conll09 \
    -eval  $EXP_DIR/da/preprocessed-web-data/da-ud-dev.conll09 \
    -out   $EXP_DIR/da/pos-tagger/mate-tools/da-ud-dev-udweb_tagged.conll09 \
    -i 10 -cores 4 -hsize 90000001

#java -Xmx12g -classpath $MATETOOLS_JAR is2.tag.Tagger \
#    -train $EXP_DIR/de/preprocessed-web-data/de-ud-train.conll09 \
#    -model $EXP_DIR/de/pos-tagger/mate-tools/de-ud-web.mdl \
#    -test  $EXP_DIR/de/preprocessed-web-data/de-ud-dev.conll09 \
#    -eval  $EXP_DIR/de/preprocessed-web-data/de-ud-dev.conll09 \
#    -out   $EXP_DIR/de/pos-tagger/mate-tools/de-ud-dev-udweb_tagged.conll09 \
#    -i 10 -cores 4 -hsize 90000001

#java -Xmx12g -classpath $MATETOOLS_JAR is2.tag.Tagger \
#    -train $EXP_DIR/en/preprocessed-web-data/en-ud-train.conll09 \
#    -model $EXP_DIR/en/pos-tagger/mate-tools/en-ud-web.mdl \
#    -test  $EXP_DIR/en/preprocessed-web-data/en-ud-dev.conll09 \
#    -eval  $EXP_DIR/en/preprocessed-web-data/en-ud-dev.conll09 \
#    -out   $EXP_DIR/en/pos-tagger/mate-tools/en-ud-dev-udweb_tagged.conll09 \
#    -i 10 -cores 4 -hsize 90000001

java -Xmx12g -classpath $MATETOOLS_JAR is2.tag.Tagger \
    -train $EXP_DIR/es/preprocessed-web-data/es-ud-train.conll09 \
    -model $EXP_DIR/es/pos-tagger/mate-tools/es-ud-web.mdl \
    -test  $EXP_DIR/es/preprocessed-web-data/es-ud-dev.conll09 \
    -eval  $EXP_DIR/es/preprocessed-web-data/es-ud-dev.conll09 \
    -out   $EXP_DIR/es/pos-tagger/mate-tools/es-ud-dev-udweb_tagged.conll09 \
    -i 10 -cores 4 -hsize 90000001

java -Xmx12g -classpath $MATETOOLS_JAR is2.tag.Tagger \
    -train $EXP_DIR/et/preprocessed-web-data/et-ud-train.conll09 \
    -model $EXP_DIR/et/pos-tagger/mate-tools/et-ud-web.mdl \
    -test  $EXP_DIR/et/preprocessed-web-data/et-ud-dev.conll09 \
    -eval  $EXP_DIR/et/preprocessed-web-data/et-ud-dev.conll09 \
    -out   $EXP_DIR/et/pos-tagger/mate-tools/et-ud-dev-udweb_tagged.conll09 \
    -i 10 -cores 4 -hsize 90000001

java -Xmx12g -classpath $MATETOOLS_JAR is2.tag.Tagger \
    -train $EXP_DIR/fi/preprocessed-web-data/fi-ud-train.conll09 \
    -model $EXP_DIR/fi/pos-tagger/mate-tools/fi-ud-web.mdl \
    -test  $EXP_DIR/fi/preprocessed-web-data/fi-ud-dev.conll09 \
    -eval  $EXP_DIR/fi/preprocessed-web-data/fi-ud-dev.conll09 \
    -out   $EXP_DIR/fi/pos-tagger/mate-tools/fi-ud-dev-udweb_tagged.conll09 \
    -i 10 -cores 4 -hsize 90000001

java -Xmx12g -classpath $MATETOOLS_JAR is2.tag.Tagger \
    -train $EXP_DIR/fr/preprocessed-web-data/fr-ud-train.conll09 \
    -model $EXP_DIR/fr/pos-tagger/mate-tools/fr-ud-web.mdl \
    -test  $EXP_DIR/fr/preprocessed-web-data/fr-ud-dev.conll09 \
    -eval  $EXP_DIR/fr/preprocessed-web-data/fr-ud-dev.conll09 \
    -out   $EXP_DIR/fr/pos-tagger/mate-tools/fr-ud-dev-udweb_tagged.conll09 \
    -i 10 -cores 4 -hsize 90000001

java -Xmx12g -classpath $MATETOOLS_JAR is2.tag.Tagger \
    -train $EXP_DIR/gr/preprocessed-web-data/el-ud-train.conll09 \
    -model $EXP_DIR/gr/pos-tagger/mate-tools/el-ud-web.mdl \
    -test  $EXP_DIR/gr/preprocessed-web-data/el-ud-dev.conll09 \
    -eval  $EXP_DIR/gr/preprocessed-web-data/el-ud-dev.conll09 \
    -out   $EXP_DIR/gr/pos-tagger/mate-tools/el-ud-dev-udweb_tagged.conll09 \
    -i 10 -cores 4 -hsize 90000001

#java -Xmx12g -classpath $MATETOOLS_JAR is2.tag.Tagger \
#    -train $EXP_DIR/hi/preprocessed-web-data/hi-ud-train.conll09 \
#    -model $EXP_DIR/hi/pos-tagger/mate-tools/hi-ud-web.mdl \
#    -test  $EXP_DIR/hi/preprocessed-web-data/hi-ud-dev.conll09 \
#    -eval  $EXP_DIR/hi/preprocessed-web-data/hi-ud-dev.conll09 \
#    -out   $EXP_DIR/hi/pos-tagger/mate-tools/hi-ud-dev-udweb_tagged.conll09 \
#    -i 10 -cores 4 -hsize 90000001

java -Xmx12g -classpath $MATETOOLS_JAR is2.tag.Tagger \
    -train $EXP_DIR/it/preprocessed-web-data/it-ud-train.conll09 \
    -model $EXP_DIR/it/pos-tagger/mate-tools/it-ud-web.mdl \
    -test  $EXP_DIR/it/preprocessed-web-data/it-ud-dev.conll09 \
    -eval  $EXP_DIR/it/preprocessed-web-data/it-ud-dev.conll09 \
    -out   $EXP_DIR/it/pos-tagger/mate-tools/it-ud-dev-udweb_tagged.conll09 \
    -i 10 -cores 4 -hsize 90000001

java -Xmx12g -classpath $MATETOOLS_JAR is2.tag.Tagger \
    -train $EXP_DIR/nl/preprocessed-web-data/nl-ud-train.conll09 \
    -model $EXP_DIR/nl/pos-tagger/mate-tools/nl-ud-web.mdl \
    -test  $EXP_DIR/nl/preprocessed-web-data/nl-ud-dev.conll09 \
    -eval  $EXP_DIR/nl/preprocessed-web-data/nl-ud-dev.conll09 \
    -out   $EXP_DIR/nl/pos-tagger/mate-tools/nl-ud-dev-udweb_tagged.conll09 \
    -i 10 -cores 4 -hsize 90000001

#java -Xmx12g -classpath $MATETOOLS_JAR is2.tag.Tagger \
#    -train $EXP_DIR/sv/preprocessed-web-data/sv-ud-train.conll09 \
#    -model $EXP_DIR/sv/pos-tagger/mate-tools/sv-ud-web.mdl \
#    -test  $EXP_DIR/sv/preprocessed-web-data/sv-ud-dev.conll09 \
#    -eval  $EXP_DIR/sv/preprocessed-web-data/sv-ud-dev.conll09 \
#    -out   $EXP_DIR/sv/pos-tagger/mate-tools/sv-ud-dev-udweb_tagged.conll09 \
#    -i 10 -cores 4 -hsize 90000001

