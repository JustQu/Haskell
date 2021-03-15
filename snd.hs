--snd' = snd

snd' :: (a, b) -> b
snd' (_, y) = y

get_snd :: [(a, b)] -> [b]
get_snd [] = []
get_snd (x: xs) = snd x : get_snd xs

main :: IO()
-- main = print $ snd' ("hello", 571)
main = print $ get_snd list
    where list = [(1, "First"), (2, "Second"), (3, "Third")]
