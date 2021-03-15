func :: Int -> String
func x = case x of
    1960 -> "1-9-6-0"
    1970 -> "1-9-7-0"
    1980 -> "1-9-8-0"
    1990 -> "1-9-9-0"
    otherwise -> "nothing"

main = let year = 1970 in print $ func year

-- main = print $ func year where year = 1970
