module Main where


import Test.HUnit
import Test.Framework (defaultMain)
import Test.Framework.Providers.HUnit (hUnitTestToTests)
import FacebookTest


main :: IO ()
main = defaultMain $ hUnitTestToTests $ TestList
  [ FacebookTest.tests
  ]
