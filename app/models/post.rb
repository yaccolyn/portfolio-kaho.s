class Post < ApplicationRecord
  validates :store_name, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 1000}

  belongs_to :user
  belongs_to :location_information, optional: true
  has_many :favorites, dependent: :destroy

  accepts_nested_attributes_for :location_information

  mount_uploaders :images, ImageUploader
end

#comment,tagについては随時追加
#位置情報機能実装の時に, optional: trueは削除