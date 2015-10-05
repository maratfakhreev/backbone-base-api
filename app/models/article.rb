class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  scope :with_users, -> { includes(:user, comments: [:user]) }

  validates :user, :title, :text, presence: true
end
