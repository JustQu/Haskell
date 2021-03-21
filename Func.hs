module Func(factorial, fibonacci) where

factorial :: Integer -> Integer
factorial x | x < 2 = 1
factorial x = (*) x $ factorial $ x - 1

fibonacci :: Integer -> Integer
fibonacci x | x < 3 = 1
fibonacci x = fibonacci (x - 1) + fibonacci (x - 2)
