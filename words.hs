import Data.Char (isSpace)

--words' = words
words' :: String -> [String]
words' [] = []
words' (x:xs) | isSpace x = words' xs
words' xs = takeWhile (not . isSpace) xs : (words' $ dropWhile (not . isSpace) xs)
