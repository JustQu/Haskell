max1 :: (Ord a => a -> a -> a)
max1 x y
	| x <= y = y
	| otherwise = x

max3 :: (Ord a => a -> a -> a -> a)
max3 x y z = max1 (max1 x y) z