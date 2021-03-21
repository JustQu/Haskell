-- isSpace' = isSpace
isSpace :: Char -> Bool
isSpace x = if x == ' ' || x == '\t' || x == '\n' then True else False
