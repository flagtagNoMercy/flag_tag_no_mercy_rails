class CaptureFlag < ActiveRecord::Base
  belongs_to :flag
  belongs_to :player
end
