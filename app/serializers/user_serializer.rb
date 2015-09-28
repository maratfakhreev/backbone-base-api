class UserSerializer < ApplicationSerializer
  attributes :id, :authentication_token, :email, :name, :avatar
end
