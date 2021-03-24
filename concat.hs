-- concat' = concat

concat' :: [[a]] -> [a]
concat' [] = []
concat'(xs:xxs) = xs ++ concat' xxs
