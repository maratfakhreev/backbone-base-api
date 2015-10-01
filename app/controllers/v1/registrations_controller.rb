class V1::RegistrationsController < ApplicationController
  wrap_parameters :user

  expose(:user, attributes: :user_params)

  def create
    if user.save
      respond_with user, serializer: UserSerializer
    else
      respond_with status: 500
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation, :avatar)
  end
end
