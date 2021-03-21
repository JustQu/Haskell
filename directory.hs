import System.Directory

main :: IO()
-- main = createDirectory "testDir"
-- main = renameDirectory "testDir" "newNameTestDir"
-- main = removeDirectory "newNameTestDir"
-- main = doesDirectoryExist ".vscode" >>= print
-- main = getDirectoryContents "." >>= print
-- main = getCurrentDirectory >>= print
-- main = getPermissions "." >>= print
main = getPermissions "." >>= \xs -> print $ readable xs
