-- repeat' = repeat
repeat' :: a -> [a]
repeat' x = x : repeat' x
