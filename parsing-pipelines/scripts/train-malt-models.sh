export MALT_JAR="$HOME/Documents/softwares/nlp-tools/parsers/malt/maltparser-1.7.2/maltparser-1.7.2.jar"
export EXP_DIR="$HOME/Documents/chalmers-work/gf-parsing/ud-parsing/v1.2"

#------------------------------------------------------------------------------
### lang="ar"

java -Xmx10G -jar $MALT_JAR \
    -w "$EXP_DIR/ar/full-models/web_model/" \
    -c ar-ud-web -i "$EXP_DIR/ar/preprocessed-web-data/ar-ud-train-matetagged.conll" \
    -F "$EXP_DIR/ar/full-models/web_model/addMergPOSTAGS0I0FORMStack0.xml" \
    -m learn -l liblinear -lo "-s_4_-c_0.1" \
    -grl root -pcr none -a nivreeager -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/ar/full-models/web_model/" \
    -c ar-ud-web -i "$EXP_DIR/ar/pos-tagger/mate-tools/ar-ud-dev-udweb_tagged.conll" \
    -o "$EXP_DIR/ar/full-models/web_model/ar-ud-dev-maltparsed.conll" \
    -m parse -grl root -pcr none -a nivreeager -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/ar/full-models/web_model/" \
    -c ar-ud-web -i "$EXP_DIR/ar/pos-tagger/mate-tools/ar-ud-test-udweb_tagged.conll" \
    -o "$EXP_DIR/ar/full-models/web_model/ar-ud-test-maltparsed.conll" \
    -m parse -grl root -pcr none -a nivreeager -nr true -ne false

java -Xmx10G -jar $MALT_JAR \
    -w "$EXP_DIR/ar/full-models/goldtags_model/" \
    -c ar-ud-web -i "$EXP_DIR/ar/preprocessed-web-data/ar-ud-train.conll" \
    -F "$EXP_DIR/ar/full-models/goldtags_model/addMergPOSTAGS0I0FORMStack0.xml" \
    -m learn -l liblinear -lo "-s_4_-c_0.1" \
    -grl root -pcr none -a nivreeager -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/ar/full-models/goldtags_model/" \
    -c ar-ud-web -i "$EXP_DIR/ar/preprocessed-web-data/ar-ud-dev.conll" \
    -o "$EXP_DIR/ar/full-models/goldtags_model/ar-ud-dev-maltparsed.conll" \
    -m parse -grl root -pcr none -a nivreeager -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/bl/full-models/goldtags_model/" \
    -c ar-ud-web -i "$EXP_DIR/ar/preprocessed-web-data/ar-ud-test.conll" \
    -o "$EXP_DIR/ar/full-models/goldtags_model/ar-ud-test-maltparsed.conll" \
    -m parse -grl root -pcr none -a nivreeager -nr true -ne false

#------------------------------------------------------------------------------
### lang="bg"

java -Xmx10G -jar $MALT_JAR \
    -w "$EXP_DIR/bl/full-models/web_model/" \
    -c bg-ud-web -i "$EXP_DIR/bl/preprocessed-web-data/bg-ud-train-matetagged.conll" \
    -F "$EXP_DIR/bl/full-models/web_model/addMergPOSTAGI0FORMStack0.xml" \
    -m learn -l liblinear -lo "-s_4_-c_0.1" \
    -grl root -pcr none -a stackproj -pp head -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/bl/full-models/web_model/" \
    -c bg-ud-web -i "$EXP_DIR/bl/pos-tagger/mate-tools/bg-ud-dev-udweb_tagged.conll" \
    -o "$EXP_DIR/bl/full-models/web_model/bg-ud-dev-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackproj -pp head -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/bl/full-models/web_model/" \
    -c bg-ud-web -i "$EXP_DIR/bl/pos-tagger/mate-tools/bg-ud-test-udweb_tagged.conll" \
    -o "$EXP_DIR/bl/full-models/web_model/bg-ud-test-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackproj -pp head -nr true -ne false

java -Xmx10G -jar $MALT_JAR \
    -w "$EXP_DIR/bl/full-models/goldtags_model/" \
    -c bg-ud-web -i "$EXP_DIR/bl/preprocessed-web-data/bg-ud-train.conll" \
    -F "$EXP_DIR/bl/full-models/goldtags_model/addMergPOSTAGI0FORMStack0.xml" \
    -m learn -l liblinear -lo "-s_4_-c_0.1" \
    -grl root -pcr none -a stackproj -pp head -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/bl/full-models/goldtags_model/" \
    -c bg-ud-web -i "$EXP_DIR/bl/preprocessed-web-data/bg-ud-dev.conll" \
    -o "$EXP_DIR/bl/full-models/goldtags_model/bg-ud-dev-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackproj -pp head -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/bl/full-models/goldtags_model/" \
    -c bg-ud-web -i "$EXP_DIR/bl/preprocessed-web-data/bg-ud-test.conll" \
    -o "$EXP_DIR/bl/full-models/goldtags_model/bg-ud-test-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackproj -pp head -nr true -ne false

#------------------------------------------------------------------------------
### lang="da"

java -Xmx10G -jar $MALT_JAR \
    -w "$EXP_DIR/da/full-models/web_model/" \
    -c da-ud-web -i "$EXP_DIR/da/preprocessed-web-data/da-ud-train-matetagged.conll" \
    -F "$EXP_DIR/da/full-models/web_model/addMergPOSTAGI0FORMStack1.xml" \
    -m learn -l liblinear -lo "-s_4_-c_0.1" \
    -grl root -pcr none -a stackproj -pp head -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/da/full-models/web_model/" \
    -c da-ud-web -i "$EXP_DIR/da/pos-tagger/mate-tools/da-ud-dev-udweb_tagged.conll" \
    -o "$EXP_DIR/da/full-models/web_model/da-ud-dev-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackproj -pp head -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/da/full-models/web_model/" \
    -c da-ud-web -i "$EXP_DIR/da/pos-tagger/mate-tools/da-ud-test-udweb_tagged.conll" \
    -o "$EXP_DIR/da/full-models/web_model/da-ud-test-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackproj -pp head -nr true -ne false

java -Xmx10G -jar $MALT_JAR \
    -w "$EXP_DIR/da/full-models/goldtags_model/" \
    -c da-ud-web -i "$EXP_DIR/da/preprocessed-web-data/da-ud-train.conll" \
    -F "$EXP_DIR/da/full-models/goldtags_model/addMergPOSTAGI0FORMStack1.xml" \
    -m learn -l liblinear -lo "-s_4_-c_0.1" \
    -grl root -pcr none -a stackproj -pp head -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/da/full-models/goldtags_model/" \
    -c da-ud-web -i "$EXP_DIR/da/preprocessed-web-data/da-ud-dev.conll" \
    -o "$EXP_DIR/da/full-models/goldtags_model/da-ud-dev-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackproj -pp head -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/da/full-models/goldtags_model/" \
    -c da-ud-web -i "$EXP_DIR/da/preprocessed-web-data/da-ud-test.conll" \
    -o "$EXP_DIR/da/full-models/goldtags_model/da-ud-test-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackproj -pp head -nr true -ne false

#------------------------------------------------------------------------------
### lang="de"

java -Xmx10G -jar $MALT_JAR \
    -w "$EXP_DIR/de/full-models/web_model/" \
    -c de-ud-web -i "$EXP_DIR/de/preprocessed-web-data/de-ud-train-matetagged.conll" \
    -F "$EXP_DIR/de/full-models/web_model/addMergPOSTAGS0I0FORMLookahead1.xml" \
    -m learn -l liblinear -lo "-s_4_-c_0.1" \
    -grl root -pcr none -a stackproj -pp head -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/de/full-models/web_model/" \
    -c de-ud-web -i "$EXP_DIR/de/pos-tagger/mate-tools/de-ud-dev-udweb_tagged.conll" \
    -o "$EXP_DIR/de/full-models/web_model/de-ud-dev-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackproj -pp head -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/de/full-models/web_model/" \
    -c de-ud-web -i "$EXP_DIR/de/pos-tagger/mate-tools/de-ud-test-udweb_tagged.conll" \
    -o "$EXP_DIR/de/full-models/web_model/de-ud-test-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackproj -pp head -nr true -ne false

java -Xmx10G -jar $MALT_JAR \
    -w "$EXP_DIR/de/full-models/goldtags_model/" \
    -c de-ud-web -i "$EXP_DIR/de/preprocessed-web-data/de-ud-train.conll" \
    -F "$EXP_DIR/de/full-models/goldtags_model/addMergPOSTAGS0I0FORMLookahead1.xml" \
    -m learn -l liblinear -lo "-s_4_-c_0.1" \
    -grl root -pcr none -a stackproj -pp head -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/de/full-models/goldtags_model/" \
    -c de-ud-web -i "$EXP_DIR/de/preprocessed-web-data/de-ud-dev.conll" \
    -o "$EXP_DIR/de/full-models/goldtags_model/de-ud-dev-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackproj -pp head -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/de/full-models/goldtags_model/" \
    -c de-ud-web -i "$EXP_DIR/de/preprocessed-web-data/de-ud-test.conll" \
    -o "$EXP_DIR/de/full-models/goldtags_model/de-ud-test-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackproj -pp head -nr true -ne false

#------------------------------------------------------------------------------
### lang="el"

java -Xmx10G -jar $MALT_JAR \
    -w "$EXP_DIR/gr/full-models/web_model/" \
    -c el-ud-web -i "$EXP_DIR/gr/preprocessed-web-data/el-ud-train-matetagged.conll" \
    -F "$EXP_DIR/gr/full-models/web_model/addMergPOSTAGI0FORMLookahead0.xml" \
    -m learn -l liblinear -lo "-s_4_-c_0.1" \
    -grl root -pcr none -a stackproj -pp head -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/gr/full-models/web_model/" \
    -c el-ud-web -i "$EXP_DIR/gr/pos-tagger/mate-tools/el-ud-dev-udweb_tagged.conll" \
    -o "$EXP_DIR/gr/full-models/web_model/el-ud-dev-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackproj -pp head -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/gr/full-models/web_model/" \
    -c el-ud-web -i "$EXP_DIR/gr/pos-tagger/mate-tools/el-ud-test-udweb_tagged.conll" \
    -o "$EXP_DIR/gr/full-models/web_model/el-ud-test-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackproj -pp head -nr true -ne false

java -Xmx10G -jar $MALT_JAR \
    -w "$EXP_DIR/gr/full-models/goldtags_model/" \
    -c el-ud-web -i "$EXP_DIR/gr/preprocessed-web-data/el-ud-train.conll" \
    -F "$EXP_DIR/gr/full-models/goldtags_model/addMergPOSTAGI0FORMLookahead0.xml" \
    -m learn -l liblinear -lo "-s_4_-c_0.1" \
    -grl root -pcr none -a stackproj -pp head -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/gr/full-models/goldtags_model/" \
    -c el-ud-web -i "$EXP_DIR/gr/preprocessed-web-data/el-ud-dev.conll" \
    -o "$EXP_DIR/gr/full-models/goldtags_model/el-ud-dev-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackproj -pp head -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/gr/full-models/goldtags_model/" \
    -c el-ud-web -i "$EXP_DIR/gr/preprocessed-web-data/el-ud-test.conll" \
    -o "$EXP_DIR/gr/full-models/goldtags_model/el-ud-test-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackproj -pp head -nr true -ne false

#------------------------------------------------------------------------------
### lang="en"

java -Xmx10G -jar $MALT_JAR \
    -w "$EXP_DIR/en/full-models/web_model/" \
    -c en-ud-web -i "$EXP_DIR/en/preprocessed-web-data/en-ud-train-matetagged.conll" \
    -F "$EXP_DIR/en/full-models/web_model/addMergPOSTAGI0FORMStack0.xml" \
    -m learn -l liblinear -lo "-s_4_-c_0.1" \
    -grl root -pcr none -a stackproj -pp head -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/en/full-models/web_model/" \
    -c en-ud-web -i "$EXP_DIR/en/pos-tagger/mate-tools/en-ud-dev-udweb_tagged.conll" \
    -o "$EXP_DIR/en/full-models/web_model/en-ud-dev-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackproj -pp head -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/en/full-models/web_model/" \
    -c en-ud-web -i "$EXP_DIR/en/pos-tagger/mate-tools/en-ud-test-udweb_tagged.conll" \
    -o "$EXP_DIR/en/full-models/web_model/en-ud-test-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackproj -pp head -nr true -ne false

java -Xmx10G -jar $MALT_JAR \
    -w "$EXP_DIR/en/full-models/goldtags_model/" \
    -c en-ud-web -i "$EXP_DIR/en/preprocessed-web-data/en-ud-train.conll" \
    -F "$EXP_DIR/en/full-models/goldtags_model/addMergPOSTAGI0FORMStack0.xml" \
    -m learn -l liblinear -lo "-s_4_-c_0.1" \
    -grl root -pcr none -a stackproj -pp head -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/en/full-models/goldtags_model/" \
    -c en-ud-web -i "$EXP_DIR/en/preprocessed-web-data/en-ud-dev.conll" \
    -o "$EXP_DIR/en/full-models/goldtags_model/en-ud-dev-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackproj -pp head -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/en/full-models/goldtags_model/" \
    -c en-ud-web -i "$EXP_DIR/en/preprocessed-web-data/en-ud-test.conll" \
    -o "$EXP_DIR/en/full-models/goldtags_model/en-ud-test-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackproj -pp head -nr true -ne false

#------------------------------------------------------------------------------
### lang="es"

java -Xmx10G -jar $MALT_JAR \
    -w "$EXP_DIR/es/full-models/web_model/" \
    -c es-ud-web -i "$EXP_DIR/es/preprocessed-web-data/es-ud-train-matetagged.conll" \
    -F "$EXP_DIR/es/full-models/web_model/addMergPOSTAGI0FORMStack0.xml" \
    -m learn -l liblinear -lo "-s_4_-c_0.1" \
    -grl root -pcr none -a stackproj -pp head -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/es/full-models/web_model/" \
    -c es-ud-web -i "$EXP_DIR/es/pos-tagger/mate-tools/es-ud-dev-udweb_tagged.conll" \
    -o "$EXP_DIR/es/full-models/web_model/es-ud-dev-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackproj -pp head -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/es/full-models/web_model/" \
    -c es-ud-web -i "$EXP_DIR/es/pos-tagger/mate-tools/es-ud-test-udweb_tagged.conll" \
    -o "$EXP_DIR/es/full-models/web_model/es-ud-test-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackproj -pp head -nr true -ne false

java -Xmx10G -jar $MALT_JAR \
    -w "$EXP_DIR/es/full-models/goldtags_model/" \
    -c es-ud-web -i "$EXP_DIR/es/preprocessed-web-data/es-ud-train.conll" \
    -F "$EXP_DIR/es/full-models/goldtags_model/addMergPOSTAGI0FORMStack0.xml" \
    -m learn -l liblinear -lo "-s_4_-c_0.1" \
    -grl root -pcr none -a stackproj -pp head -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/es/full-models/goldtags_model/" \
    -c es-ud-web -i "$EXP_DIR/es/preprocessed-web-data/es-ud-dev.conll" \
    -o "$EXP_DIR/es/full-models/goldtags_model/es-ud-dev-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackproj -pp head -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/es/full-models/goldtags_model/" \
    -c es-ud-web -i "$EXP_DIR/es/preprocessed-web-data/es-ud-test.conll" \
    -o "$EXP_DIR/es/full-models/goldtags_model/es-ud-test-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackproj -pp head -nr true -ne false

#------------------------------------------------------------------------------
### lang="et"

java -Xmx10G -jar $MALT_JAR \
    -w "$EXP_DIR/et/full-models/web_model/" \
    -c et-ud-web -i "$EXP_DIR/et/preprocessed-web-data/et-ud-train-matetagged.conll" \
    -F "$EXP_DIR/et/full-models/web_model/addMergPOSTAGI0FORMStack0.xml" \
    -m learn -l liblinear -lo "-s_4_-c_0.1" \
    -grl root -pcr none -a stackproj -pp head -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/et/full-models/web_model/" \
    -c et-ud-web -i "$EXP_DIR/et/pos-tagger/mate-tools/et-ud-dev-udweb_tagged.conll" \
    -o "$EXP_DIR/et/full-models/web_model/et-ud-dev-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackproj -pp head -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/et/full-models/web_model/" \
    -c et-ud-web -i "$EXP_DIR/et/pos-tagger/mate-tools/et-ud-test-udweb_tagged.conll" \
    -o "$EXP_DIR/et/full-models/web_model/et-ud-test-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackproj -pp head -nr true -ne false

java -Xmx10G -jar $MALT_JAR \
    -w "$EXP_DIR/et/full-models/goldtags_model/" \
    -c et-ud-web -i "$EXP_DIR/et/preprocessed-web-data/et-ud-train.conll" \
    -F "$EXP_DIR/et/full-models/goldtags_model/addMergPOSTAGI0FORMStack0.xml" \
    -m learn -l liblinear -lo "-s_4_-c_0.1" \
    -grl root -pcr none -a stackproj -pp head -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/et/full-models/goldtags_model/" \
    -c et-ud-web -i "$EXP_DIR/et/preprocessed-web-data/et-ud-dev.conll" \
    -o "$EXP_DIR/et/full-models/goldtags_model/et-ud-dev-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackproj -pp head -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/et/full-models/goldtags_model/" \
    -c et-ud-web -i "$EXP_DIR/et/preprocessed-web-data/et-ud-test.conll" \
    -o "$EXP_DIR/et/full-models/goldtags_model/et-ud-test-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackproj -pp head -nr true -ne false

#------------------------------------------------------------------------------
### lang="fi"

java -Xmx10G -jar $MALT_JAR \
    -w "$EXP_DIR/fi/full-models/web_model/" \
    -c fi-ud-web -i "$EXP_DIR/fi/preprocessed-web-data/fi-ud-train-matetagged.conll" \
    -F "$EXP_DIR/fi/full-models/web_model/addMergPOSTAGS0I0FORMInput0.xml" \
    -m learn -l liblinear -lo "-s_4_-c_0.1" \
    -grl root -pcr none -a nivreeager -pp path -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/fi/full-models/web_model/" \
    -c fi-ud-web -i "$EXP_DIR/fi/pos-tagger/mate-tools/fi-ud-dev-udweb_tagged.conll" \
    -o "$EXP_DIR/fi/full-models/web_model/fi-ud-dev-maltparsed.conll" \
    -m parse -grl root -pcr none -a nivreeager -pp path -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/fi/full-models/web_model/" \
    -c fi-ud-web -i "$EXP_DIR/fi/pos-tagger/mate-tools/fi-ud-test-udweb_tagged.conll" \
    -o "$EXP_DIR/fi/full-models/web_model/fi-ud-test-maltparsed.conll" \
    -m parse -grl root -pcr none -a nivreeager -pp path -nr true -ne false

java -Xmx10G -jar $MALT_JAR \
    -w "$EXP_DIR/fi/full-models/goldtags_model/" \
    -c fi-ud-web -i "$EXP_DIR/fi/preprocessed-web-data/fi-ud-train.conll" \
    -F "$EXP_DIR/fi/full-models/goldtags_model/addMergPOSTAGS0I0FORMInput0.xml" \
    -m learn -l liblinear -lo "-s_4_-c_0.1" \
    -grl root -pcr none -a nivreeager -pp path -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/fi/full-models/goldtags_model/" \
    -c fi-ud-web -i "$EXP_DIR/fi/preprocessed-web-data/fi-ud-dev.conll" \
    -o "$EXP_DIR/fi/full-models/goldtags_model/fi-ud-dev-maltparsed.conll" \
    -m parse -grl root -pcr none -a nivreeager -pp path -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/fi/full-models/goldtags_model/" \
    -c fi-ud-web -i "$EXP_DIR/fi/preprocessed-web-data/fi-ud-test.conll" \
    -o "$EXP_DIR/fi/full-models/goldtags_model/fi-ud-test-maltparsed.conll" \
    -m parse -grl root -pcr none -a nivreeager -pp path -nr true -ne false

#------------------------------------------------------------------------------
### lang="fr"

java -Xmx10G -jar $MALT_JAR \
    -w "$EXP_DIR/fr/full-models/web_model/" \
    -c fr-ud-web -i "$EXP_DIR/fr/preprocessed-web-data/fr-ud-train-matetagged.conll" \
    -F "$EXP_DIR/fr/full-models/web_model/addMergPOSTAGI0FORMStack0.xml" \
    -m learn -l liblinear -lo "-s_4_-c_0.1" \
    -grl root -pcr none -a stacklazy -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/fr/full-models/web_model/" \
    -c fr-ud-web -i "$EXP_DIR/fr/pos-tagger/mate-tools/fr-ud-dev-udweb_tagged.conll" \
    -o "$EXP_DIR/fr/full-models/web_model/fr-ud-dev-maltparsed.conll" \
    -m parse -grl root -pcr none -a stacklazy -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/fr/full-models/web_model/" \
    -c fr-ud-web -i "$EXP_DIR/fr/pos-tagger/mate-tools/fr-ud-test-udweb_tagged.conll" \
    -o "$EXP_DIR/fr/full-models/web_model/fr-ud-test-maltparsed.conll" \
    -m parse -grl root -pcr none -a stacklazy -nr true -ne false

java -Xmx10G -jar $MALT_JAR \
    -w "$EXP_DIR/fr/full-models/goldtags_model/" \
    -c fr-ud-web -i "$EXP_DIR/fr/preprocessed-web-data/fr-ud-train.conll" \
    -F "$EXP_DIR/fr/full-models/goldtags_model/addMergPOSTAGI0FORMStack0.xml" \
    -m learn -l liblinear -lo "-s_4_-c_0.1" \
    -grl root -pcr none -a stacklazy -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/fr/full-models/goldtags_model/" \
    -c fr-ud-web -i "$EXP_DIR/fr/preprocessed-web-data/fr-ud-dev.conll" \
    -o "$EXP_DIR/fr/full-models/goldtags_model/fr-ud-dev-maltparsed.conll" \
    -m parse -grl root -pcr none -a stacklazy -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/fr/full-models/goldtags_model/" \
    -c fr-ud-web -i "$EXP_DIR/fr/preprocessed-web-data/fr-ud-test.conll" \
    -o "$EXP_DIR/fr/full-models/goldtags_model/fr-ud-test-maltparsed.conll" \
    -m parse -grl root -pcr none -a stacklazy -nr true -ne false

#------------------------------------------------------------------------------
### lang="hi"

java -Xmx10G -jar $MALT_JAR \
    -w "$EXP_DIR/hi/full-models/web_model/" \
    -c hi-ud-web -i "$EXP_DIR/hi/preprocessed-web-data/hi-ud-train-matetagged.conll" \
    -F "$EXP_DIR/hi/full-models/web_model/addMergPOSTAGS0I0FORMStack1.xml" \
    -m learn -l liblinear -lo "-s_4_-c_0.2" \
    -grl root -pcr none -a nivreeager -pp head -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/hi/full-models/web_model/" \
    -c hi-ud-web -i "$EXP_DIR/hi/pos-tagger/mate-tools/hi-ud-dev-udweb_tagged.conll" \
    -o "$EXP_DIR/hi/full-models/web_model/hi-ud-dev-maltparsed.conll" \
    -m parse -grl root -pcr none -a nivreeager -pp head -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/hi/full-models/web_model/" \
    -c hi-ud-web -i "$EXP_DIR/hi/pos-tagger/mate-tools/hi-ud-test-udweb_tagged.conll" \
    -o "$EXP_DIR/hi/full-models/web_model/hi-ud-test-maltparsed.conll" \
    -m parse -grl root -pcr none -a nivreeager -pp head -nr true -ne false

java -Xmx10G -jar $MALT_JAR \
    -w "$EXP_DIR/hi/full-models/goldtags_model/" \
    -c hi-ud-web -i "$EXP_DIR/hi/preprocessed-web-data/hi-ud-train.conll" \
    -F "$EXP_DIR/hi/full-models/goldtags_model/addMergPOSTAGS0I0FORMStack1.xml" \
    -m learn -l liblinear -lo "-s_4_-c_0.2" \
    -grl root -pcr none -a nivreeager -pp head -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/hi/full-models/goldtags_model/" \
    -c hi-ud-web -i "$EXP_DIR/hi/preprocessed-web-data/hi-ud-dev.conll" \
    -o "$EXP_DIR/hi/full-models/goldtags_model/hi-ud-dev-maltparsed.conll" \
    -m parse -grl root -pcr none -a nivreeager -pp head -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/hi/full-models/goldtags_model/" \
    -c hi-ud-web -i "$EXP_DIR/hi/preprocessed-web-data/hi-ud-test.conll" \
    -o "$EXP_DIR/hi/full-models/goldtags_model/hi-ud-test-maltparsed.conll" \
    -m parse -grl root -pcr none -a nivreeager -pp head -nr true -ne false

#------------------------------------------------------------------------------
### lang="it"

java -Xmx10G -jar $MALT_JAR \
    -w "$EXP_DIR/it/full-models/web_model/" \
    -c it-ud-web -i "$EXP_DIR/it/preprocessed-web-data/it-ud-train-matetagged.conll" \
    -F "$EXP_DIR/it/full-models/web_model/addMergPOSTAGS0I0FORMLookahead1.xml" \
    -m learn -l liblinear -lo "-s_4_-c_0.1" \
    -grl root -pcr none -a stackproj -pp baseline -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/it/full-models/web_model/" \
    -c it-ud-web -i "$EXP_DIR/it/pos-tagger/mate-tools/it-ud-dev-udweb_tagged.conll" \
    -o "$EXP_DIR/it/full-models/web_model/it-ud-dev-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackproj -pp baseline -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/it/full-models/web_model/" \
    -c it-ud-web -i "$EXP_DIR/it/pos-tagger/mate-tools/it-ud-test-udweb_tagged.conll" \
    -o "$EXP_DIR/it/full-models/web_model/it-ud-test-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackproj -pp baseline -nr true -ne false

java -Xmx10G -jar $MALT_JAR \
    -w "$EXP_DIR/it/full-models/goldtags_model/" \
    -c it-ud-web -i "$EXP_DIR/it/preprocessed-web-data/it-ud-train.conll" \
    -F "$EXP_DIR/it/full-models/goldtags_model/addMergPOSTAGS0I0FORMLookahead1.xml" \
    -m learn -l liblinear -lo "-s_4_-c_0.1" \
    -grl root -pcr none -a stackproj -pp baseline -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/it/full-models/goldtags_model/" \
    -c it-ud-web -i "$EXP_DIR/it/preprocessed-web-data/it-ud-dev.conll" \
    -o "$EXP_DIR/it/full-models/goldtags_model/it-ud-dev-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackproj -pp baseline -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/it/full-models/goldtags_model/" \
    -c it-ud-web -i "$EXP_DIR/it/preprocessed-web-data/it-ud-test.conll" \
    -o "$EXP_DIR/it/full-models/goldtags_model/it-ud-test-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackproj -pp baseline -nr true -ne false

#------------------------------------------------------------------------------
### lang="nl"

java -Xmx10G -jar $MALT_JAR \
    -w "$EXP_DIR/nl/full-models/web_model/" \
    -c nl-ud-web -i "$EXP_DIR/nl/preprocessed-web-data/nl-ud-train-matetagged.conll" \
    -F "$EXP_DIR/nl/full-models/web_model/addMergPOSTAGS0I0FORMStack1.xml" \
    -m learn -l liblinear -lo "-s_4_-c_0.1" \
    -grl root -pcr none -a stackproj -pp head+path -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/nl/full-models/web_model/" \
    -c nl-ud-web -i "$EXP_DIR/nl/pos-tagger/mate-tools/nl-ud-dev-udweb_tagged.conll" \
    -o "$EXP_DIR/nl/full-models/web_model/nl-ud-dev-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackproj -pp head+path -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/nl/full-models/web_model/" \
    -c nl-ud-web -i "$EXP_DIR/nl/pos-tagger/mate-tools/nl-ud-test-udweb_tagged.conll" \
    -o "$EXP_DIR/nl/full-models/web_model/nl-ud-test-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackproj -pp head+path -nr true -ne false

java -Xmx10G -jar $MALT_JAR \
    -w "$EXP_DIR/nl/full-models/goldtags_model/" \
    -c nl-ud-web -i "$EXP_DIR/nl/preprocessed-web-data/nl-ud-train.conll" \
    -F "$EXP_DIR/nl/full-models/goldtags_model/addMergPOSTAGS0I0FORMStack1.xml" \
    -m learn -l liblinear -lo "-s_4_-c_0.1" \
    -grl root -pcr none -a stackproj -pp head+path -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/nl/full-models/goldtags_model/" \
    -c nl-ud-web -i "$EXP_DIR/nl/preprocessed-web-data/nl-ud-dev.conll" \
    -o "$EXP_DIR/nl/full-models/goldtags_model/nl-ud-dev-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackproj -pp head+path -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/nl/full-models/goldtags_model/" \
    -c nl-ud-web -i "$EXP_DIR/nl/preprocessed-web-data/nl-ud-test.conll" \
    -o "$EXP_DIR/nl/full-models/goldtags_model/nl-ud-test-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackproj -pp head+path -nr true -ne false

#------------------------------------------------------------------------------
### lang="sv"

java -Xmx10G -jar $MALT_JAR \
    -w "$EXP_DIR/sv/full-models/web_model/" \
    -c sv-ud-web -i "$EXP_DIR/sv/preprocessed-web-data/sv-ud-train-matetagged.conll" \
    -F "$EXP_DIR/sv/full-models/web_model/addMergPOSTAGI0FORMLookahead0.xml" \
    -m learn -l liblinear -lo "-s_4_-c_0.1" \
    -grl root -pcr none -a stackeager -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/sv/full-models/web_model/" \
    -c sv-ud-web -i "$EXP_DIR/sv/pos-tagger/mate-tools/sv-ud-dev-udweb_tagged.conll" \
    -o "$EXP_DIR/sv/full-models/web_model/sv-ud-dev-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackeager -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/sv/full-models/web_model/" \
    -c sv-ud-web -i "$EXP_DIR/sv/pos-tagger/mate-tools/sv-ud-test-udweb_tagged.conll" \
    -o "$EXP_DIR/sv/full-models/web_model/sv-ud-test-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackeager -nr true -ne false

java -Xmx10G -jar $MALT_JAR \
    -w "$EXP_DIR/sv/full-models/goldtags_model/" \
    -c sv-ud-web -i "$EXP_DIR/sv/preprocessed-web-data/sv-ud-train.conll" \
    -F "$EXP_DIR/sv/full-models/goldtags_model/addMergPOSTAGI0FORMLookahead0.xml" \
    -m learn -l liblinear -lo "-s_4_-c_0.1" \
    -grl root -pcr none -a stackeager -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/sv/full-models/goldtags_model/" \
    -c sv-ud-web -i "$EXP_DIR/sv/preprocessed-web-data/sv-ud-dev.conll" \
    -o "$EXP_DIR/sv/full-models/goldtags_model/sv-ud-dev-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackeager -nr true -ne false

java -jar $MALT_JAR \
    -w "$EXP_DIR/sv/full-models/goldtags_model/" \
    -c sv-ud-web -i "$EXP_DIR/sv/preprocessed-web-data/sv-ud-test.conll" \
    -o "$EXP_DIR/sv/full-models/goldtags_model/sv-ud-test-maltparsed.conll" \
    -m parse -grl root -pcr none -a stackeager -nr true -ne false

