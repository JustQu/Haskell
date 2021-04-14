isPalindrome :: String -> Bool
isPalindrome x
    | x == reverse x = True
    | otherwise = False

-- main :: IO()
-- main = (read "abba") >>= isPalindrome >> print
main = do
    x <- getLine
    print $ isPalindrome x
