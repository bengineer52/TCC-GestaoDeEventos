class Event < ApplicationRecord
  belongs_to :user
  has_many :subscriptions
  has_many :users, through: :subscriptions

  def manager?(param_user)
    user.id == param_user.id
  end

  def subscribed?(param_user)
    subscriptions.exists?(user_id: param_user.id)
  end

  def find_subscription(param_user)
    subscriptions.find_by(user_id: param_user)
  end
end
