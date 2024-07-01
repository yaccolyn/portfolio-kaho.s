class Post < ApplicationRecord
  belongs_to :user
  belongs_to :location_information
end
