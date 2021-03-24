-- maximum' = maximum
maximum' :: Ord a => [a] -> a
maximum' [] = undefined
maximum' [x] = x
maximum' (x:xs) = max x $ maximum' xs
