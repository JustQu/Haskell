data List a = Empty | Cons a (List a) deriving Show

func :: [a] -> List a
func [] = Empty
func (x:xs) = Cons x (func xs)

-- main::IO()
-- main = print $ Cons 5 (Cons 6 (Cons 7 Empty))

main :: IO()
main = print $ func [4,5,6]
