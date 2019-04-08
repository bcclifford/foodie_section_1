class Dish < ApplicationRecord
  # Direct associations

  belongs_to :cuisine

  has_many   :favorites,
             :dependent => :destroy

  # Indirect associations

  has_many   :venues,
             :through => :favorites,
             :source => :venue

  # Validations

end
