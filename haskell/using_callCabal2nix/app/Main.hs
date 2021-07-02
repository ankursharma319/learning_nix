module Main where

import qualified Greeter (greet)

main :: IO ()
main = do
  putStrLn "Hello, Haskell!"
  putStrLn $ Greeter.greet "world"
