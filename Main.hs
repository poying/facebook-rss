module Main where


import Text.RSS
import Network.HTTP
import Options.Applicative


data App = App
  { token :: String
  , id :: String
  }


app :: Parser App
app = App
  <$> strOption
    ( long "token"
    <> metavar "TOKEN"
    <> help "Facebook access token")
  <*> strOption
    ( long "id"
    <> metavar "ID"
    <> help "Facebook page/user ID")


main :: IO ()
main = execParser opts >>= run
  where
    opts = info (helper <*> app)
      ( fullDesc
      <> progDesc "Generate facebook page/user rss feed")


run :: App -> IO ()
run (App token id) = return ()


getFeedRequest :: String -> String -> IO String
getFeedRequest token id =
  simpleHTTP (getRequest (genRequestUrl token id)) >>= getResponseBody


genRequestUrl :: String -> String -> String
genRequestUrl token id =
  "https://graph.facebook.com/v2.7/"
  ++ id
  ++ "?access_token=" ++ token
  ++ "&fields=name,about,link,feed"
