export MATETOOLS_JAR="$HOME/Documents/softwares/nlp-tools/parsers/mate-tools/anna-3.61.jar"

java -Xmx16G -classpath $MATETOOLS_JAR is2.parser.Parser -model $1 -test $2 -out $3 -cores 4 
#java -Xmx16G -classpath $MATETOOLS_JAR is2.tag.Tagger -model $1 -test $2 -out $3 -cores 8 -eval $2


#export MATETOOLS_JAR="$HOME/Documents/softwares/nlp-tools/parsers/mate-tools/anna-3.3.jar"

#java -Xmx16G -classpath $MATETOOLS_JAR is2.transitionR6j.Parser \
#    -beam 40 -1st a -2nd abcd -3rd ab -tsize 1 \
#    -tthreshold 0.2 -tx 2 -half 2 -tt 25 \
#    -model $1 \
#    -test  $2 \
#    -out   $3 \
#    -cores 4 
