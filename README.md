# BabyCobolRecognizer

This repository contains the code for a recognizer and a negative sample generator for the language BabyCobol.



Both tools rely on an ANTLR parser, the parser found in  `src/gen` was generated with the BabyCobol grammar found in the file `grammars/22goingmerry/BabyCobol.g4`.

The negative sample generator is based on the word mutation method described by Raselimo, Taljaard and Fischer in their paper _Breaking parsers: mutation-based generation of programs with guaranteed syntax errors_ [[1]](#1).


<a id="1">[1]</a> 
Moeketsi Raselimo, Jan Taljaard, and Bernd Fischer. 2019. Breaking parsers: mutation-based generation of programs with guaranteed syntax errors. In Proceedings of the 12th ACM SIGPLAN International Conference on Software Language Engineering (SLE 2019). Association for Computing Machinery, New York, NY, USA, 83–87. https://doi.org/10.1145/3357766.3359542
