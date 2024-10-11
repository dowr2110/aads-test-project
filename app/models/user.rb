# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy

  has_many :subscriptions, foreign_key: :follower_id, class_name: 'Subscription'
  has_many :followings, through: :subscriptions, source: :following

  has_many :subscribers, foreign_key: :following_id, class_name: 'Subscription'
  has_many :followers, through: :subscribers, source: :follower

  has_many :comments, dependent: :destroy

  def subscriptions_posts
    Post.where(user: followings.pluck(:id)).order(created_at: :desc)
  end

  def follow(user)
    subscriptions.create(following: user) unless following?(user)
  end

  def unfollow(user)
    subscriptions.find_by(following: user).destroy
  end

  def following?(user)
    followings.include?(user)
  end
end
