cd "stpos"
java -mx300m -classpath stanford-postagger.jar edu.stanford.nlp.tagger.maxent.MaxentTagger -model models/english-left3words-distsim.tagger -textFile "$tag_rel_path" > ../tagged.txt
cd ..
python3 tokenizer.py
python3 ngrams_finder.py
python3 sentence_ex.py $filename
python3 eval.py $filename
