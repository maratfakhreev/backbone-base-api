class ArticleSerializer < ApplicationSerializer
  attributes :title, :text, :name
  has_many :comments, serializer: CommentSerializer

  def name
    object.user.name
  end
end
