class V1::ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:destroy, :create]

  def index
    @articles = Article.all
    respond_with @articles, each_serializer: ArticleSerializer
  end

  def show
    @article = Article.find(params[:id])
    respond_with @article, serializer: ArticleSerializer
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.user == current_user
      @article.destroy
      respond_with status: 204
    else
      respond_with status: 401
    end
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      respond_with status: 200
    else
      respond_with status: 500
    end
  end

  private

  def article_params
    params.permit(:id, :title, :text)
  end
end
