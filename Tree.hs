data Tree a = Empty | Node a (Tree a) (Tree a) deriving Show

tree :: Ord a => a -> Tree a -> Tree a
tree x Empty = Node x Empty Empty
tree x (Node y left right)
    | x == y = Node x left right
    | x < y = Node y (tree x left) right
    | x > y = Node y left (tree x right)

-- найти указанный элемент в дереве
treeElem :: Ord a => a -> Tree a -> Bool
treeElem x Empty = False
treeElem x (Node a left right)
    | x == a = True
    | x < a = treeElem x left
    | x > a = treeElem x right

main :: IO()
x = foldr tree Empty [5, 4, 2, 3]
main = print $ treeElem 4 x
