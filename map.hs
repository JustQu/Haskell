--map' = map

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs

main :: IO()
-- main = print $ map (^2) [1..5]
main = print $ map' (\x -> (^) x 2) [1..5]
