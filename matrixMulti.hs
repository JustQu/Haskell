
--first element
multi :: [Int] -> [[Int]] ->[Int]
multi [] [] = []
multi [] _ = error "10"
multi _ [] = error "20"
multi (x:xs) (y:ys) = x * head y : multi xs ys

reduce :: [[Int]] -> [[Int]]
reduce [] = []
reduce (x:xxs) = check ((tail x) : reduce xxs)
	where
		check [[]] = []
		check x = x

--calculate one row
firstRow :: [Int] -> [[Int]] -> [Int]
firstRow _ [] = []
firstRow [] _ = []
firstRow x y = sum (multi x y) : firstRow x (reduce y)


matrixMulti :: [[Int]] -> [[Int]] -> [[Int]]
matrixMulti [] [] = []
matrixMulti [] _ = []
matrixMulti (x:xs) y = firstRow x y : matrixMulti xs y
