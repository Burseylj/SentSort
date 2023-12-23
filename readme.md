# SentSort

SentSort takes a text file and returns a new text file with each sentence, line separated and alphabetized.

## Compilation Instructions

You'll need GHC (Glasgow Haskell Compiler) to compile this program. Use the following command in Bash or PowerShell:

```cmd
ghc --make SentSort.hs
```

## Use Instructons
Compile on your machine or run in ghc or use the windows executable provided. 
Run in a command line with the filename of the text file to be sorted as the only argument.

```cmd
.\SentSort.exe .\TheLastQuestion.txt
```

You can also run in interpreted mode by using runhaskell. Then you don't have to compile (you still need ghc).
```cmd
runhaskell SentSort.hs .\TheLastQuestion.txt
```
## Design Assumptions
- The text file is in English, without unicode characters.
	*Importing unicode libraries could relax this assumption.
- A sentence ends if and only if there is a period, question mark, exclamation mark, end of quotation or end of line.
	* This means punctuation is not used expressively (eg, "Hello...World.") or in abbreviations.
	* We can relax this assumption by using third party NLP tools to parse sentences.

## Design Decisions
- We remove quotation marks from the output to avoid confusing cases where only one quotation mark is output.
	* eg, ( "Hello. Hello World.") would output ("Hello.) as a sentence.
- We treat the end of a quotation as the end of a sentence. 
	* Linguistically this is a grey area, in this case we say that the change in voice is enough to warrent seperate sentence.
