class Country a where
    location :: a -> String
    square :: a -> Int

data Poland = Poland
data Canada = Canada

instance Country Poland where
    location Poland = "Europe"
    square Poland = 312670

instance Country Canada where
    location Canada = "North America"
    square Canada = 9984670

info :: Country a => a -> (String, Int)
info x = (location x, square x)

-- main :: IO()
-- main = print $ info Canada

class Country a => Europe a where
    neighbors :: a -> [String]

instance Europe Poland where
    neighbors Poland = ["Belarus", "German"]

info_europe :: Europe a => a -> (String, Int, [String])
info_europe x = (location x, square x, neighbors x)

main :: IO()
main = print $ info_europe Poland
