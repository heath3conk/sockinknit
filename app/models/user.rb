class User < ActiveRecord::Base
  # Remember to create a migration!

  has_many :projects, foreign_key: :knitter_id
  has_many :patterns, through: :projects
  has_many :recipients, through: :projects


  validates_presence_of :email, :hashed_password
  validates_uniqueness_of :email, message: "Sorry, but that email has already been taken"
  validates_format_of :email, with: /\S+@\S+\.\S+/, message: "Sorry, you have entered an invalid email address. Make sure the format is example@example.com"

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(plain_text_password)
    @password = BCrypt::Password.create(plain_text_password)
    self.hashed_password = @password
  end

  def authenticate?(entered_password)
    self.password == entered_password
  end

end
