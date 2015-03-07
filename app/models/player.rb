class Player < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  has_many :capture_flags
  validates :user_id, length: { in: 2..10 }
  validates_uniqueness_of :user_id, scope: :game_id

end
