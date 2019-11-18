listsum :: [Int] -> Int
listsum [] = 0
listsum (x:xs) = x + listsum xs