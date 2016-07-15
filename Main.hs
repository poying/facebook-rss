module Main where


import FacebookRSS
import Options.Applicative


data App = App
  { token :: String
  , id :: String
  } deriving (Show)


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
run (App token id) = p =<< generate token id
  where
    p (Just str) = putStrLn str
    p _ = putStrLn "Something is wrong..."
