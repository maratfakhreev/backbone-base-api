class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :user, :title, :text, presence: true
end
