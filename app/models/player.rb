class Player < ActiveRecord::Base
  belongs_to :user
  belongs_to :game, :counter_cache => true
  has_many :capture_flags
  has_many :flags

  validates :user_id, length: { in: 1..10 }
  validates_uniqueness_of :user_id, scope: :game_id

end
