module TestUtils (describe) where


import Test.HUnit


describe :: String -> [Test] -> Test
describe des = TestLabel des . TestList


it :: String -> Test -> Test
it = TestLabel
