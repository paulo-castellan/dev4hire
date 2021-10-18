class Expertise < ApplicationRecord
  validates :field_of_expertise, presence: true
  validates :field_of_expertise, uniqueness: {case_sensitive: false,  message: "Área de atuação deve ser única"}
  has_many :dev_profiles


end
