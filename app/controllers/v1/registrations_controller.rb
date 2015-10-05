module V1
  class RegistrationsController < ApplicationController
    wrap_parameters :user

    expose(:user, attributes: :user_params)

    def create
      user.save

      respond_with user, serializer: UserSerializer
    end

    private

    def user_params
      params.permit(:name, :email, :password, :password_confirmation, :avatar)
    end
  end
end
