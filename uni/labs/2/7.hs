f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f x y = ((snd x, snd y), (fst x, fst y))

main :: IO()
main = print $ f (1, 2) (3, 4)
