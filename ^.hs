--(^^^) = (^)
(^^^) :: Num a => a -> Int -> a
(^^^) _ 0 = 1
(^^^) _ y | y < 0 = error "error"
(^^^) x y
	| y `mod` 2 == 0 = (^^^) (x * x) (y `div` 2)
	| otherwise = x * (^^^) x (y - 1)
