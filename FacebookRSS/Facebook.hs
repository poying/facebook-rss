{-# LANGUAGE OverloadedStrings #-}


module FacebookRSS.Facebook (fetchFeed) where


import Debug.Trace
import Data.Maybe
import Data.Aeson
import Data.Facebook.Feed
import Network.HTTP.Client
import Network.HTTP.Client.TLS (tlsManagerSettings)


fetchFeed :: String -> String -> IO (Maybe Feed)
fetchFeed token id =
  newManager tlsManagerSettings
    >>= httpLbs req
    >>= return . decode . responseBody
  where
    req = fromJust . parseUrl $ fetchFeedUrl token id


fetchFeedUrl :: String -> String -> String
fetchFeedUrl token id =
  "https://graph.facebook.com/v2.7/"
  ++ id
  ++ "?access_token=" ++ token
  ++ "&fields=name,about,link,feed{message,id,created_time,permalink_url}"
