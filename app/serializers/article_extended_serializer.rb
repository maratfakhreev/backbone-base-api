class ArticleExtendedSerializer < ArticleSerializer
  attributes :text, :name, :avatar
  has_many :comments, serializer: CommentSerializer

  def name
    object.user.name
  end

  def avatar
    object.user.avatar
  end
end
