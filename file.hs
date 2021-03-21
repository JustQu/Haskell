import Control.Exception (catch, IOException)

try_open:: (FilePath -> IO String) -> FilePath -> IO String
try_open func path = catch (func path) maybe_err
    where
        maybe_err :: IOException -> IO String
        maybe_err err = return $ show err --message

main :: IO()
-- main = writeFile "file.txt" "hello"
-- main = appendFile "file.txt" ", world"
-- main = readFile "file.txt" >>= print
main = (print =<< try_open readFile "file.txt") >> print "end of file"
