class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # アクセストークンを更新
  def update_access_token!
    self.access_token = "#{self.id}:u#{Devise.friendly_token}"
    save
  end
end
