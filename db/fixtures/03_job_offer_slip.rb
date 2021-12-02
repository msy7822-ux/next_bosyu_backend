Corporate.all.each.with_index do |c, i|
  JobOfferSlip.seed do |j|
    j.id = i + 1
    j.corporate_id = c.id
    j.title = '勢いも課題も満載の弊社で採用担当してくれる人募集！！'
    j.content = "最近の弊社はリリースなどのいいニュースなども多く順風満帆なスタートアップと思われがちですが、課題も満載です。採用もその一つで基本的に高望みしたい気持ちもあり、難易度が高いです。\nどなたか助けていただけませんか？\n\n少しでもご興味やご質問があればDMでお話しさせてください！\n\n※ちなみに人事経験は不問です。"
    j.displayed = true
  end
end
