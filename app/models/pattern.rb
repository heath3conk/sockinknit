class Pattern < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :project
  has_one :knitter, through: :project
  has_one :recipient, through: :project

end
