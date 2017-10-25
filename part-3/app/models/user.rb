class User < ActiveRecord::Base
  include BCrypt
  has_many :potluck_attendances
  has_many :potlucks, through: :potluck_attendances, source: :potluck
  has_many :potluck_host_events, class_name: "Potluck", foreign_key: :host_id

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
  validate :validate_password
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(plain_text_password)
    @raw_password = plain_text_password
    @password = Password.create(plain_text_password)
    self.password_hash = @password
  end

  def authenticate(plain_text_password)
    self.password == plain_text_password
  end

  def validate_password
    if @raw_password.nil?
      errors.add(:password, "is required")
    elsif @raw_password.length < 6
      errors.add(:password, "must be 6 characters or more")
    end
  end

  def has_potlucks_to_host?
    self.potluck_host_events.length > 0
  end

  def upcoming_events
    self.potluck_host_events.select do |event|
      event.starts_at > Time.now.utc
    end
  end
end
