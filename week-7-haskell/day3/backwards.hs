module Main where
  backwards :: [a] -> [a]
  backwards [] = []
  backwards (h:t) = backwards t ++ [h]
