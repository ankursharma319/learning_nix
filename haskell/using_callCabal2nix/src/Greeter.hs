module Greeter where

import Data.Text.Titlecase

greet :: String -> String
greet x = titlecase $ "Hello, " <> x <> "!"
