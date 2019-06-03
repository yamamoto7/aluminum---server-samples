class Auth < ApplicationRecord
  mount_uploader :image, PhotoUploader
  has_many :posts
end
