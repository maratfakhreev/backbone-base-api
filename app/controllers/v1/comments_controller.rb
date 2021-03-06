module V1
  class CommentsController < ApplicationController
    acts_as_token_authentication_handler_for User, only: %i(create)

    expose(:article)
    expose(:comments, ancestor: :article)
    expose(:comment, attributes: :comments_params)

    def create
      comment.user = current_user
      comment.save

      respond_with comment, serializer: CommentSerializer
    end

    private

    def comments_params
      params.permit(:article_id, :text)
    end
  end
end
