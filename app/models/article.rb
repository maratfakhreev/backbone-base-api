class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  paginates_per 10

  scope :with_users, -> { includes(:user, comments: [:user]) }

  validates :user, :text, presence: true
  validates :title, length: { minimum: 3 }, presence: true
end
