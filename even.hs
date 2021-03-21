--even' = even

even' :: Integral a => a -> Bool
even' x | mod x 2 == 0 = True
even' _ = False
