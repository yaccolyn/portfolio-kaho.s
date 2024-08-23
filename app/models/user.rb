class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true

  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post

  mount_uploader :avatar, AvatarUploader

  def own?(post)
    post.user_id == id
  end

  def favorite(post)
    favorite_posts << post
  end

  def unfavorite(post)
    favorite_posts.destroy(post)
  end

  def favorite?(post)
    favorite_posts.include?(post)
  end
end
