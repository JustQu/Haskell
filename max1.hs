max1 :: (Ord a => a -> a -> a)
max1 x y
	| x <= y = y
	| otherwise = x