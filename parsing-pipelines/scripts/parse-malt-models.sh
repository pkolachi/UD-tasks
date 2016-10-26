export MALT_JAR="$HOME/Documents/softwares/nlp-tools/parsers/malt/maltparser-1.7.2/maltparser-1.7.2.jar"
export EXP_DIR="$HOME/Documents/chalmers-work/gf-parsing/ud-parsing/v1.2"

### lang="ar"
#java -jar $MALT_JAR -w "$EXP_DIR/ar/full-models/goldtags_model/" -c ar-ud-web -i $1 -o $2 -m parse -grl root -pcr none -a nivreeager -nr true -ne false
#java -jar $MALT_JAR -w "$EXP_DIR/ar/full-models/web_model/" -c ar-ud-web -i $1 -o $2 -m parse -grl root -pcr none -a nivreeager -nr true -ne false
### lang="bg"
#java -jar $MALT_JAR -w "$EXP_DIR/bl/full-models/web_model/" -c bg-ud-web -i $1 -o $2 -m parse -grl root -pcr none -a stackproj -pp head -nr true -ne false
### lang="da"
#java -jar $MALT_JAR -w "$EXP_DIR/da/full-models/web_model/" -c da-ud-web -i $1 -o $2 -m parse -grl root -pcr none -a stackproj -pp head -nr true -ne false
### lang="de"
#java -jar $MALT_JAR -w "$EXP_DIR/de/full-models/web_model/" -c de-ud-web -i $1 -o $2 -m parse -grl root -pcr none -a stackproj -pp head -nr true -ne false
### lang="el"
#java -jar $MALT_JAR -w "$EXP_DIR/gr/full-models/web_model/" -c el-ud-web -i $1 -o $2 -m parse -grl root -pcr none -a stackproj -pp head -nr true -ne false
### lang="en"
#java -jar $MALT_JAR -w "$EXP_DIR/en/full-models/web_model/" -c en-ud-web -i $1 -o $2 -m parse -grl root -pcr none -a stackproj -pp head -nr true -ne false
### lang="es"
#java -jar $MALT_JAR -w "$EXP_DIR/es/full-models/web_model/" -c es-ud-web -i $1 -o $2 -m parse -grl root -pcr none -a stackproj -pp head -nr true -ne false
### lang="et"
#java -jar $MALT_JAR -w "$EXP_DIR/et/full-models/web_model/" -c et-ud-web -i $1 -o $2 -m parse -grl root -pcr none -a stackproj -pp head -nr true -ne false
### lang="fi"
#java -jar $MALT_JAR -w "$EXP_DIR/fi/full-models/web_model/" -c fi-ud-web -i $1 -o $2 -m parse -grl root -pcr none -a nivreeager -pp path -nr true -ne false
### lang="fr"
#java -jar $MALT_JAR -w "$EXP_DIR/fr/full-models/web_model/" -c fr-ud-web -i $1 -o $2 -m parse -grl root -pcr none -a stacklazy -nr true -ne false
### lang="hi"
#java -jar $MALT_JAR -w "$EXP_DIR/hi/full-models/web_model/" -c hi-ud-web -i $1 -o $2 -m parse -grl root -pcr none -a nivreeager -pp head -nr true -ne false
### lang="it"
#java -jar $MALT_JAR -w "$EXP_DIR/it/full-models/web_model/" -c it-ud-web -i $1 -o $2 -m parse -grl root -pcr none -a stackproj -pp baseline -nr true -ne false
### lang="nl"
java -jar $MALT_JAR -w "$EXP_DIR/nl/full-models/web_model/" -c nl-ud-web -i $1 -o $2 -m parse -grl root -pcr none -a stackproj -pp head+path -nr true -ne false
### lang="sv"
#java -jar $MALT_JAR -w "$EXP_DIR/sv/full-models/web_model/" -c sv-ud-web -i $1 -o $2 -m parse -grl root -pcr none -a stackeager -nr true -ne false

