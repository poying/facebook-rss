module FacebookRSS (generate) where


import FacebookRSS.RSS
import FacebookRSS.Facebook


generate :: String -> String -> IO (Maybe String)
generate token id = return . mfeedToString =<< fetchFeed token id
  where
    mfeedToString (Just feed) = Just . fromFeed $ feed
    mfeedToString _ = Nothing
