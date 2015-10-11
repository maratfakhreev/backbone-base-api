module V1
  class DashboardController < ApplicationController
    acts_as_token_authentication_handler_for User

    expose(:articles) { current_user.articles }

    def index
      respond_with articles, each_serializer: ArticleSerializer
    end
  end
end
