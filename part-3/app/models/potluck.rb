class Potluck < ActiveRecord::Base
  has_many :potluck_attendances
  has_many :attendees, through: :potluck_attendances, source: :user
  belongs_to :host, class_name: "User"
  validates :name, :location, :starts_at, :host_id, presence: true

  def self.current
    self.select do |event|
      event.starts_at >= Time.now.utc
    end
  end

  # def past
  #   self.starts_at > Time.now.utc
  # end
end
