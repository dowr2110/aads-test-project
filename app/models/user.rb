class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy

  has_many :subscriptions, foreign_key: :follower_id, class_name: 'Subscription'
  has_many :followings, through: :subscriptions, source: :following

  has_many :subscribers, foreign_key: :following_id, class_name: 'Subscription'
  has_many :followers, through: :subscribers, source: :follower

  has_many :comments, dependent: :destroy
end
