import Data.List (sortBy)
import Data.List.Split (splitOn)
import Data.Char(toLower,isLetter)




myWords = "This is one sentence. This is another. \"This, is yet a third.\""
nowSent = splitOn ". " myWords

makeComparable ys = map toLower $ filter (isLetter) ys 

getSents = splitOn ". "

sort' = sortBy (\x y -> compare (makeComparable x) (makeComparable y))