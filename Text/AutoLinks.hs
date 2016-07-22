module Text.AutoLinks (autoLinks) where


import Text.Regex (Regex, subRegex, mkRegex)


regex :: Regex
regex = mkRegex "(https?|ftp)://[^\t\n\v\f\r ]+"


autoLinks :: String -> String
autoLinks msg =
  subRegex regex msg "<a href=\"\\0\">\\0</a>"
