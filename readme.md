----------Compilation Instructions -------------
You'll need ghc to compile this program. Use the command 'ghc --make SentSort.hs' in bash or powershell.
You can also run it in interpreted mode with ghc.

----------Use Instructions-------------
Compile on your machine or run in ghc or use the appropriate executable for your machine (I've tried to include a few). 
Run in a command line with the filename of the text file to be sorted as the only argument.
ex: .\SentSort.exe .\TheLastQuestion.txt
You can also run in interpreted mode by using runhaskell. Then you don't have to compile (you still need ghc).
ex: runhaskell SentSort.hs .\TheLastQuestion.txt

----------Design Assumptions--------
- The text file is in English, without unicode characters.
	*Importing unicode libraries could relax this assumption.
- A sentence ends if and only if there is a period, question mark, exclamation mark, end of quotation or end of line.
	* This means punctuation is not used expressively (eg, "Hello...World.") or in abbreviations.
	* We can relax this assumption by using third party NLP tools to parse sentences.

----------Design Decisions----------
- We remove quotation marks from the output to avoid confusing cases where only one quotation mark is output.
	* eg, ( "Hello. Hello World.") would output ("Hello.) as a sentence.
- We treat the end of a quotation as the end of a sentence. 
	Linguistically this is a grey area, in this case we say that the change in voice is enough to warrent seperate sentence.