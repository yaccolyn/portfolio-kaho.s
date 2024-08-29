# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Tag.delete_all

# 新しいデータの作成
tags = [
  "メロンパン", "カレーパン", "あんパン", "クリームパン", "ジャムパン", "コッペパン", "ウィンナーロール",
  "ピザパン", "あんドーナツ", "明太フランス",
  "バゲット", "パン・ド・カンパーニュ", "クロワッサン", "パン・オ・ショコラ", "クロワッサン・ザマンド", 
  "ブリオッシュ", "クグロフ", "ベーコンエピ",
  "プレッツェル", "ライ麦パン", "シュトーレン",
  "スコーン", "イギリス食パン", "イングリッシュマフィン",
  "デニッシュ",
  "角食パン", "ロールパン", "ベーグル", "シナモンロール", "ドーナツ", "バブカ",
  "ポンデケージョ", "フォカッチャ", "グリッシーニ", "パニーニ", "チャバタ", "パネットーネ",
  "ピロシキ",
  "ふかっ", "もちっ", "もっちゅり", "ぎゅっ", "ざくっ", "サク", "ふわ", "とろ", "ちゅる", "うる", 
  "パリ", "むち",
  "ハード", "高加水", "ソフト", "セミハード"
]

tags.each do |tag_name|
  Tag.create(name: tag_name)
end