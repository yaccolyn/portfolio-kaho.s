class Post < ApplicationRecord
  validates :store_name, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 1000}

  belongs_to :user
  belongs_to :location_information, optional: true
  has_many :favorites, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  accepts_nested_attributes_for :location_information

  mount_uploaders :images, ImageUploader

  def self.ransackable_attributes(auth_object = nil)
    ["content", "store_name", "created_at", "id", "images", "location_information_id", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["favorites", "location_information", "post_tags", "tags", "user"]
  end
end

#commentについては随時追加
#位置情報機能実装の時に, optional: trueは削除