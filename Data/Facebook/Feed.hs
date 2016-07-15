{-# LANGUAGE OverloadedStrings #-}


module Data.Facebook.Feed (Feed(..)) where


import Data.Aeson
import Data.Facebook.Post


data Feed = Feed
  { name :: String
  , about :: String
  , link :: String
  , posts :: [Post]
  } deriving (Show, Eq)


instance FromJSON Feed where
  parseJSON (Object o) = Feed
    <$> (o .: "name")
    <*> (o .: "about")
    <*> (o .: "link")
    <*> ((o .: "feed") >>= (.: "data") >>= parseJSON)
