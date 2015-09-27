class CommentSerializer < ApplicationSerializer
  attributes :text, :name, :avatar

  def name
    object.user.name
  end

  def avatar
    object.user.avatar
  end
end
