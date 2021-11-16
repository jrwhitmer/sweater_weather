class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
  validates :api_key, uniqueness: true, presence: true

  def self.find_by_email(email)
    select('users.*')
    .where('email = ?', email)
    .first
  end
end
