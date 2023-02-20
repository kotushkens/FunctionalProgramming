
--test1 = TestCase (assertEqual "for (foo 3)," (1,2) (smallestDivisibleByAll 3))
--

main :: IO ()
prop_reverseReverse :: [Int] -> Bool
prop_reverseReverse xs = reverse (reverse xs) == xs
--main = putStrLn (assertEqual "for (foo 3)," (1,2) (smallestDivisibleByAll 3))
--putStrLn "Test suite not yet implemented"
