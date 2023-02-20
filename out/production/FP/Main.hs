module Main (main) where

import Euler

list1 = take 20 [1,2..]
list2 = take 1000 [1..]

main :: IO ()
main = do
  --What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
   print (smallestDividendByAll 20)
   print (lcmForList list1)
   --Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.
   print (argMax cycleLength list2)