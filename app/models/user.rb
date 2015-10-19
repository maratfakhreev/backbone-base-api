class User < ActiveRecord::Base
  acts_as_token_authenticatable

  devise :database_authenticatable, :registerable,
    :recoverable, :trackable, :validatable

  has_many :articles

  validates :name, length: { minimum: 3 }, presence: true
end
