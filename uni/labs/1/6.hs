myAbs :: (Ord a, Num a) => a -> a
myAbs x = if x < 0 then negate x else x
