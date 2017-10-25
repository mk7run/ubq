class Potluck < ActiveRecord::Base
  has_many :potluck_attendances
  has_many :attendies, through: :potluck_attendances, source: :user
  belongs_to :host, class_name: "User"
  validates :name, :location, :starts_at, :host_id, presence: true
end
