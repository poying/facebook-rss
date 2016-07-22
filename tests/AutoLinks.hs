module AutoLinks (tests) where


import Test.HUnit
import TestUtils
import Text.AutoLinks


tests = describe "Text.AutoLinks"
  [ describe "autoLinks"
    [ it $ assertEqual "http" "<a href=\"http://google.com\">http://google.com</a>" $ autoLinks "http://google.com"
    , it $ assertEqual "https" "<a href=\"https://google.com\">https://google.com</a>" $ autoLinks "https://google.com"
    , it $ assertEqual "middle of string" "hello <a href=\"https://google.com\">https://google.com</a> world" $ autoLinks "hello https://google.com world"
    , it $ assertEqual "unicode" "哈 <a href=\"https://google.com\">https://google.com</a> 囉" $ autoLinks "哈 https://google.com 囉"
    , it $ assertEqual "real case"
      "「但威爾遜感慨地說，其實，問題沒有這麼簡單。他指出，政府效率低，是因為它受到很多必要的制約；作為政府，不能像一般的地產商那樣無所不用其極，這勢必導致政府效率比私人企業低的現象。但是，難道我們就要用資本家來取代政府嗎？難道我們不需要政府，乾脆把政治改造成商業，把國家當作企業來運作嗎？當然不行。為什麼？威爾遜告訴我們說：「加強制約，會降低一個機構實現其主要目標的效率，但會增加該機構以非專橫的態度辦事的機會。一個效率非常高的機構可能會非常嚴厲，隨時取消我們的自由。」」 <a href=\"https://sosreader.com/politics-2/\">https://sosreader.com/politics-2/</a>"
      (autoLinks "「但威爾遜感慨地說，其實，問題沒有這麼簡單。他指出，政府效率低，是因為它受到很多必要的制約；作為政府，不能像一般的地產商那樣無所不用其極，這勢必導致政府效率比私人企業低的現象。但是，難道我們就要用資本家來取代政府嗎？難道我們不需要政府，乾脆把政治改造成商業，把國家當作企業來運作嗎？當然不行。為什麼？威爾遜告訴我們說：「加強制約，會降低一個機構實現其主要目標的效率，但會增加該機構以非專橫的態度辦事的機會。一個效率非常高的機構可能會非常嚴厲，隨時取消我們的自由。」」 https://sosreader.com/politics-2/")
    ]
  ]
