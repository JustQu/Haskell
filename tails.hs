-- tails' = tails
tails' :: [a] -> [[a]]
tails' [] = [[]]
tails' qq@(_:xs) = qq : tails' xs
