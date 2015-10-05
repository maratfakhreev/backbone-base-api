module V1
  class DashboardController < ApplicationController
    before_action :authenticate_user!

    expose(:articles) { current_user.articles }

    def index
      respond_with articles, each_serializer: ArticleSerializer
    end
  end
end
