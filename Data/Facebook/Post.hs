{-# LANGUAGE OverloadedStrings #-}


module Data.Facebook.Post (Post(..)) where


import Data.Aeson


data Post = Post
  { id :: String
  , message :: String
  , link :: String
  , createdTime :: String
  } deriving (Show, Eq)


instance FromJSON Post where
  parseJSON (Object o) = Post
    <$> (o .: "id")
    <*> (o .: "message")
    <*> (o .: "permalink_url")
    <*> (o .: "created_time")
