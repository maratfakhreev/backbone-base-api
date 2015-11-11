module V1
  class ArticlesController < ApplicationController
    acts_as_token_authentication_handler_for User, only: %i(destroy create)

    expose(:article, attributes: :article_params)
    expose(:articles) do |scope|
      scope.page(params[:page]).per(params[:per_page]).with_users
    end

    def index
      respond_with articles, serializer: ArticlesPaginatedArraySerializer, adapter: :json
    end

    def show
      respond_with article, serializer: ArticleExtendedSerializer
    end

    def destroy
      self.article = current_user.articles.find(params[:id])

      if article
        article.destroy
        respond_with status: 204
      else
        respond_with status: 401
      end
    end

    def create
      article.user = current_user
      article.save

      respond_with article, serializer: ArticleExtendedSerializer
    end

    private

    def article_params
      params.permit(:id, :title, :text)
    end
  end
end
