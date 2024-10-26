class Event < ApplicationRecord
  belongs_to :user
  has_many :subscriptions

  def manager?(param_user)
    user.id == param_user.id
  end
end
