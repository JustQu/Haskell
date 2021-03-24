-- chr' = chr

chr :: Int -> Char
chr n = if elem n [32..126]
    then [' '..'~'] !! (n - 32) else ' '
