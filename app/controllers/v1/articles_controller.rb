class V1::ArticlesController < ApplicationController
  def index
    @articles = Article.all
    respond_with @articles
  end

  def show
    @article = Article.find(params[:id])
    respond_with @article
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    respond_with status: 204
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      respond_with status: 200
    else
      respond_with status: 500
    end
  end

  private

  def article_params
    params.permit(:title, :text)
  end
end
