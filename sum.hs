{-# LANGUAGE BangPatterns #-}

--sum' = sum
sum' :: [Integer] -> Integer
sum' [] = 0
sum' (x:xs) = x + sum' xs

sum'' :: [Integer] -> Integer
sum'' = func 0
    where
        func !n [] = n
        func !n (x:xs) = func (x + n) xs
