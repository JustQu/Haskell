-- notElem' = notElem
notElem' :: Eq a => a -> [a] -> Bool
notElem' _ [] = True
notElem' y (x:xs)
    | y == x = False
    | otherwise = notElem' y xs
