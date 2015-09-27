class ArticleSerializer < ApplicationSerializer
  attributes :id, :title, :text, :name, :avatar, :comments_count
  has_many :comments, serializer: CommentSerializer

  def name
    object.user.name
  end

  def avatar
    object.user.avatar
  end

  def comments_count
    object.comments.count
  end
end
