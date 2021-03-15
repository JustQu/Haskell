-- data Nums = One | Two

-- check :: Nums -> Int
-- check One = 1
-- check Two = 2

-- main :: IO()
-- main = print $ check One


--using instance
-- instance Show Nums where
--     show One = "One"
--     show Two = "Two"

-- main :: IO()
-- main = print One

--using deriving
data Nums = One | Two deriving Show

-- main:: IO()
-- main = print One

--IPv4 here is a constructor
data IPv4 = IPv4 String Int | IPv6 String Int
get :: IPv4 -> String
get (IPv4 ip port) = "IPv4: " ++ ip ++ ". Port: " ++ show port
get (IPv6 ip port) = "IPv6: " ++ ip ++ ". Port: " ++ show port

-- main :: IO()
-- main = print $ get $ IPv6 "fe80:0:0:0:200:f8ff:fe21:67cf" 8080

data Person = Person {
    id_person :: Int,
    name      :: String,
    phone     :: String,
    email     :: String,
    cat       :: Bool
}

-- main :: IO()
-- main = print $ name some_person
--     where
--         some_person :: Person
--         some_person = Person {
--             id_person = 1,
--             name = "Alex Adamson",
--             phone = "9-876-543-21-00",
--             email = "example@email.com",
--             cat = True
--         }

--type создает синоним уже существующего типа данных
type Email = String
type Message = String

hello :: Email -> Message
hello xs = "Hello, " ++ xs

-- main :: IO()
-- main = print $ hello "example@email.com"

--newtype создает новый тип данных с конструктором и другим типом
newtype IPv4' = IPv4' String

getIP :: IPv4' -> String
getIP (IPv4' ip) = "IPv4: " ++ ip

main :: IO()
main = print $ getIP $ IPv4' "127.0.0.1"
