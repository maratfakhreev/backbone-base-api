class Comment < ActiveRecord::Base
  belongs_to :article, :user
end
