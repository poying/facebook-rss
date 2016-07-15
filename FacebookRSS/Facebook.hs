module FacebookRSS.Facebook where


import Network.HTTP


data Feed = Feed
  { name :: String
  , about :: String
  , link :: String
  , posts :: !Array
  } deriving Show


instance FromJSON Feed where
  parseJSON (Object o) = Feed
    <$> (feed >>= (.: "name"))
    <*> (feed >>= (.: "about"))
    <*> (feed >>= (.: "link"))
    <*> (feed >>= (.: "posts"))
    where
      feed = (o .: "feed")


data Post = Post
  { message :: String
  , createdTime :: String
  } deriving Show


instance FromJSON Post where
  parseJSON (Object o) = Post
    <$> (o .: "message")
    <*> (o .: "createdTime")
