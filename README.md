## サービス概要
パンの外見も知りたいけれど中身（断面）も知りたい。
断面からわかる、パンの情報があります。
パンと出会い、パンの断面をシェアしあう、パン好きがより自分好みのパンと出会うためのサービスです。

## このサービスへの思い・作りたい理由
自身もパン巡りを楽しむ者として、「こんなサービスがあったら」と思い続けていたことが、本サービス開発のきっかけです。

①位置情報について

パン好きは、とにかく色々な媒体から情報を得ます。
Instagram、Googleマップ、食べログ、パン屋さんの公式ホームページにグルメ雑誌…。
実際に巡るときは、Instagramで保存をして、Googleマップでも保存をして、と、マルチに媒体を行ったり来たり。
もちろんInstagramでもマップ検索できますが、絞り込み候補が限られていたり、欲しい情報に辿り着けないことが多々ありました。

②写真について

媒体は、掲載・投稿されている写真もそれぞれです。パンを真上から撮る人、手に持って撮る人、様々です。
パンの見た目も知りたいのですが、断面からわかることがたくさんあるのです。
断面は、パンの水分量、弾力、食感をイメージさせてくれ、訪れたい気持ちを存分に高めてくれるのです。

複数媒体の回遊を１箇所にまとめられたら。「断面」に特化したサービスがあったら。
そして、好みのパンの断面を保存し、自分だけのパンマップを作れたら。
そうした思いが、開発のきっかけになっています。

パン好きにとっての、パン巡りのお供となればと考えています。

## ユーザー層について
全年齢・性別
パン巡りが好きな人

### ユーザーが抱える問題
- 複数の媒体を組み合わせて利用する必要がある（Instagramやグルメ雑誌で気になるパン屋を見つけて、Googleマップで位置情報を保存する、など）
- Instagramなどで断面をシェアしてくれるユーザーもいるが、すべてのユーザーがそうではない。
また、ユーザーによって投稿エリアが限られることがほとんどのため、全てのエリアの人が断面を確認できるとは限らない。

### このサービスで解決できること
- 自分好みのパン屋さんを保存し、パンマップを作れる
- パンの断面を共有し合うことで、得られる情報が増える。
- マップ機能と画像閲覧機能とをサービス内で完結できる。

## サービスの利用イメージ
利用シーンは外出中・帰宅後どちらも想定しています。

- 初めて降りる駅で、何かパン屋さんはあるかマップ検索してみる。
- 旅行前に、事前準備でホテル付近のパン屋さんを下調べする。
- 散歩しながら付近の投稿を見て、新しいパン屋さんに出会う。
などです。

## ユーザーの獲得について

ユーザーがサービスを知る方法
- 技術系ブログでの紹介記事
- SNSでの紹介

## サービスの差別化ポイント・推しポイント
### パンポタ
https://www.panportal.jp/

> 「おいしいパン、お気に入りのパン屋さんをみつけたい」「プロのこだわりや食べ方を知りたい」。そんなパン好きの“パン求心”をふくらませる、おいしい時間の入口（＝パンポータル）」

パンポタでは検索機能があり、好みのパン屋さんを検索できるようになっています。
都道府県（複数選択可）・パンのカテゴリー・キーワードでの検索ができます。
店舗ごとに、店舗情報・パンの種類（各写真1枚、価格税込・別掲載）を見ることができます。

- 差別化ポイント
  
本サービスは、「断面」に特化したサービスであるということが最大の特徴です。
保存機能を搭載しており、ユーザーが「自分のパンマップ」を作れます。パンポタは保存機能がありません。
また、本サービスはユーザーの投稿によるシェアサービスですが、パンポタは日清製粉『創・食Club』による情報提供です。

## 機能候補
MVPリリース時
- ユーザー登録機能
- ログイン機能
- パスワード変更機能
- 画像投稿機能
- お気に入り保存機能
- タグ絞り込み機能
- タグ編集機能
- タグ削除機能
- 記事閲覧機能（未ログインでも閲覧可能）
- 記事編集機能
- 記事削除機能
- プロフィール編集機能
- 位置情報機能

本リリース
- マルチ検索機能
- いいね機能
- いいね解除機能
- コメント投稿機能
- コメント閲覧機能（未ログインでも閲覧可能）

## 技術スタック
### 使用技術
- バックエンド : Ruby on Rails
- フロントエンド : JavaScript
- データベース : MySQL
- 認証 : Sorcery
- 画像アップロード : Carrierwave, MiniMagick
- タグ絞り込み : Ransack
- 位置情報 : Google Maps API, Geocoding API
- その他 : Docker
### 使用予定技術
- CI/CD : GitHub Actions
- インフラ : AWS
- テスト : RSpec, Capybara

### 画面遷移図
https://www.figma.com/design/XPqySUrTaEczcdbTjDl0AB/%E7%84%A1%E9%A1%8C?node-id=0-1&t=jpxYv2w72mphSD5A-1