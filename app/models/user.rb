class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
end
