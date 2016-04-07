class Project < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :knitter, class_name: "User"
  belongs_to :recipient
  has_one    :pattern
end
