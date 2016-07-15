module Main where


import Test.HUnit
import Test.Framework (defaultMain)
import Test.Framework.Providers.HUnit (hUnitTestToTests)
import DataTest


main :: IO ()
main = defaultMain $ hUnitTestToTests $ TestList
  [ DataTest.tests
  ]
