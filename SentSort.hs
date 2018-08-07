import Data.List
import Data.List.Split 
import Data.Char


onlyLetters :: String -> String
onlyLetters ys = map toLower ( filter (isLetter) ys )

getSents :: String -> [String]
getSents x = cleanedSents
    where sents = split (condense $ endsWithOneOf ".?!\n") x
          trimmedSents = map trim sents 
          cleanedSents = filter (\x -> (onlyLetters x)  /= "") trimmedSents

sort' :: [String] -> [String]
sort' = sortBy (\x y -> compare (onlyLetters x) (onlyLetters y))

trim :: String -> String
trim = dropWhileEnd isSpace . dropWhile isSpace

main = do  
    contents <- readFile "TheLastQuestion.txt"  
    let cleanContents = [ x | x <- contents, not (x `elem` "\"") ]
        sorted = sort' . getSents $ cleanContents 
        
    writeFile "Output.txt" (intercalate "\n" sorted)