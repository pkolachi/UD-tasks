export MATETOOLS_JAR="$HOME/Documents/softwares/nlp-tools/parsers/mate-tools/anna-3.61.jar"

java -Xmx16G -classpath $MATETOOLS_JAR is2.tag.Tagger -model $1 -test $2 -out $3 -cores 8 -eval $2

