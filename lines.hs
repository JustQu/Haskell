-- lines' = lines
lines' :: String -> [String]
lines' [] = []
lines' (x:xs) | x == '\n' = lines' xs
lines' xs = takeWhile (/= '\n') xs : (lines' $ dropWhile (/= '\n') xs)
