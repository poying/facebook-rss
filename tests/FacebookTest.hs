module FacebookTest (tests) where


import TestUtils


tests = describe "FacebookRSS.Facebook"
  <$> it "parse feed"
    $ assertEqual
      (Success . Feed $ "普通人的自由主義" "QAQ" "http://google.com" [])
      (decode "{\"name\": \"普通人的自由主義\", \"about\": \"QAQ\", \"link\": \"http://google.com\", \"\": []}")
