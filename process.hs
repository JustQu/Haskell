import System.Process

main :: IO()
-- main = callCommand "MD Test"
main = system "MD Test" >>= print
