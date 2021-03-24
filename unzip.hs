-- unzip' = unzip
unzip' :: [(a, b)] -> ([a], [b])
unzip' [] = ([], [])
unzip' ((x, y):zs) = (x:fst(unzip' zs), y:snd(unzip' zs))
