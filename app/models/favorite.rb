class Favorite < ApplicationRecord
  # Direct associations

  belongs_to :venue

  belongs_to :cuisine

  belongs_to :dish

  # Indirect associations

  # Validations

end
