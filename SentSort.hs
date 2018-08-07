import Data.List
import Data.List.Split 
import Data.Char

-- Input: String
-- Output: The letters of the string in stable order
onlyLetters :: String -> String
onlyLetters ys = map toLower ( filter (isLetter) ys )

-- Input: String with standard format English writing
-- Output: List of sentences in the string in stable order
getSents :: String -> [String]
getSents x = concat sents
    where sents = map ( split (endsWith ",\"") ) sentsOnPunct
          sentsOnPunct = split (condense $ endsWithOneOf ".?!\n") x 

--Input: List of sentences, poorly formatted
--Output: List of sentences with leading and trailing whitespace removed,
-- quotation marks removed, and sentences without words removed.
cleanSents :: [String] -> [String]
cleanSents xs  = filter isEmpty trimmed 
    where isEmpty = (\x -> (onlyLetters x)  /= "")
          filtered = map (filter (\x -> x/= '\"') ) xs 
          trimmed = map trim filtered
          
--Input: List of sentences
--Output: List of sentences, alphabetically sorted, ignoring non alpha characters
sort' :: [String] -> [String]
sort' = sortBy (\x y -> compare (onlyLetters x) (onlyLetters y))

-- Input: String
-- Output: String with no leading or trailing whitespace 
trim :: String -> String
trim = dropWhileEnd isSpace . dropWhile isSpace

-- Input: English writing in standard format as text file
-- Output: Line separated alphabetized list of sentences in the writing, as text file
main = do  
    contents <- readFile "TheLastQuestion.txt"  
    let sorted = sort' . cleanSents . getSents $ contents
        
    writeFile "Output.txt" (intercalate "\n" sorted)