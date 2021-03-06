class CommentSerializer < ApplicationSerializer
  attributes :id, :text, :name, :avatar

  def name
    object.user.name
  end

  def avatar
    object.user.avatar
  end
end
