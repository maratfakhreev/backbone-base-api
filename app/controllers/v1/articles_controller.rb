class V1::ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:destroy, :create]
  expose(:article, attributes: :article_params)
  expose(:articles)

  def index
    respond_with articles, each_serializer: ArticleExtendedSerializer
  end

  def show
    respond_with article, serializer: ArticleExtendedSerializer
  end

  def destroy
    if article.user == current_user
      article.destroy
      respond_with status: 204
    else
      respond_with status: 401
    end
  end

  def create
    article.user = current_user
    if article.save
      respond_with article, serializer: ArticleExtendedSerializer
    else
      respond_with status: 500
    end
  end

  private

  def article_params
    params.permit(:id, :title, :text)
  end
end
