class DevProfile < ApplicationRecord
  validates :full_name, :social_name, :date_of_birth, :previous_experience,
            :academic_education, :description, presence: true
  
  belongs_to :dev
  belongs_to :expertise
  has_one_attached :avatar
  validates_date :date_of_birth

  validate :date_of_birth_in_the_future?

  after_commit :have_a_standard_profile_image_if_none_is_given, on: [:create]

  private

  def have_a_standard_profile_image_if_none_is_given
    unless avatar.attached?
      self.avatar.attach(io: File.open(Rails.root.join('app/assets/images/seed_images/default_profile_image.png')),
                        filename: 'default_profile_image.png', content_type: 'image/png')
    end
  end

  def date_of_birth_in_the_future?
    if date_of_birth.present? and date_of_birth > Date.today
      errors.add(:date_of_birth, 'não pode ser em datas futuras')
    end
  end

end
