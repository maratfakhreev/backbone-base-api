class CommentSerializer < ApplicationSerializer
  attributes :id, :comment, :name, :avatar

  def name
    object.user.name
  end

  def comment
    object.text
  end

  def avatar
    object.user.avatar
  end
end
