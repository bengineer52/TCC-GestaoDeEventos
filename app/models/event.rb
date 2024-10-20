class Event < ApplicationRecord
  belongs_to :user

  def manager?(param_user)
    user.id == param_user.id
  end
end
