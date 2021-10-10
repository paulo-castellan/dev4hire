class DevProfile < ApplicationRecord
  validates :full_name, :social_name, :date_of_birth, :previous_experience,
            :academic_education, :description, presence: true

  validates_date :date_of_birth
  belongs_to :dev
  belongs_to :expertise
end
