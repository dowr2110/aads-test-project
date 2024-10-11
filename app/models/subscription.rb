# == Schema Information
#
# Table name: subscriptions
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  follower_id  :bigint           not null
#  following_id :bigint           not null
#
# Indexes
#
#  index_subscriptions_on_follower_id                   (follower_id)
#  index_subscriptions_on_follower_id_and_following_id  (follower_id,following_id) UNIQUE
#  index_subscriptions_on_following_id                  (following_id)
#
# Foreign Keys
#
#  fk_rails_...  (follower_id => users.id)
#  fk_rails_...  (following_id => users.id)
#
class Subscription < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :following, class_name: 'User'
end
