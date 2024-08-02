class LocationInformation < ApplicationRecord
  has_many :posts


  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode
end

#geocoded_by :addressで、addressカラムの内容を緯度・経度に変換する
#after_validation :geocodeで、バリデーションの実行後に変換処理を実行して、latitudeカラム・longitudeカラムに緯度・経度の値が入力される。