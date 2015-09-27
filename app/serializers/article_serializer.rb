class ArticleSerializer < ApplicationSerializer
  attributes :id, :title, :comments_count

  def comments_count
    object.comments.count
  end
end
