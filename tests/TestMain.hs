module Main where


import Test.HUnit
import Test.Framework (defaultMain)
import Test.Framework.Providers.HUnit (hUnitTestToTests)
import DataTest
import AutoLinks


main :: IO ()
main = defaultMain $ hUnitTestToTests $ TestList
  [ AutoLinks.tests
  , DataTest.tests
  ]
