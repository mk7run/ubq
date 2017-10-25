class PotluckAttendance < ActiveRecord::Base
  belongs_to :user
  belongs_to :potluck

  validates :dish, :potluck_id, :user_id, presence: true
end
