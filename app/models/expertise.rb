class Expertise < ApplicationRecord
  validates :field_of_expertise, presence: true

  has_many :dev_profiles


end
