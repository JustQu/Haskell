--tail' = tail
tail' :: [a] -> [a]
tail' [] = []
tail' (_:xs) = xs