class Recipient < ActiveRecord::Base
  # Remember to create a migration!
  has_many :projects
  has_many :knitters, through: :projects
  has_many :patterns, through: :projects

end
