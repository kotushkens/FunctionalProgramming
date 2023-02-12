module Main (main) where

import Euler

--2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
--What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

list = [1,2..20]

main :: IO ()
main = do
   print (smallestDividendByAll 20)
   print (lcmForList list)