module TestUtils (describe, it) where


import Test.HUnit


describe :: String -> [Test] -> Test
describe des = TestLabel des . TestList


it :: Assertion -> Test
it = TestCase
