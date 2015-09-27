class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user

  validates :user, :article, presence: true
end
