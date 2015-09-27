class ArticleSerializer < ApplicationSerializer
  attributes :title, :text, :name

  def name
    object.user.email
  end
end
