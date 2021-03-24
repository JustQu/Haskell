-- last' = last
last' :: [a] -> a
last' [] = undefined
last xs = reverse xs !! 0
