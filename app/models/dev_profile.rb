class DevProfile < ApplicationRecord
  belongs_to :dev
  validates :full_name, :social_name, :date_of_birth, :previous_experience,
            :academic_education, :description, presence: true

  validates_date :date_of_birth

  def valid_date?
    unless Chronic.parse(from_date)
      errors.add(:from_date, "is missing or invalid")
    end
  end
end
