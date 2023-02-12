module Euler (smallestDivisibleByAll) where
  
smallestDivisibleByAll :: Int -> Int
smallestDivisibleByAll bound = helper 1 1 bound
  where
    helper n result bound
      | n > bound = result
      | result `mod` n == 0 = helper (n+1) result bound
      | otherwise = helper 1 (result+1) bound