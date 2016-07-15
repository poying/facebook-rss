{-# LANGUAGE OverloadedStrings #-}


module DataTest (tests) where


import Data.Aeson
import Test.HUnit
import TestUtils
import Data.Time
import Data.Facebook.Post
import Data.Facebook.Feed


tests = describe "Data.Facebook"
  [ it $ assertEqual "parse feed"
      (Just $ Feed "Google" "QAQ" "http://google.com" [])
      (decode "{\"name\":\"Google\",\"about\":\"QAQ\",\"link\":\"http://google.com\",\"feed\":{\"data\":[]}}")
  , it $ assertEqual "parse post"
      (Just $ Post "id" "hello" "http://google.com" "2016-07-14T21:05:25+0000")
      (decode "{\"id\": \"id\",\"message\":\"hello\",\"link\":\"http://google.com\",\"created_time\":\"2016-07-14T21:05:25+0000\"}")
  ]
