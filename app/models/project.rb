class Project < ApplicationRecord
  belongs_to :user
  belongs_to :work_type
  
  validates :title, :detailed_description, :skill_sets, :max_payment_per_hour,
            :hire_date_limit, presence: true
  validate :hire_date_limit_in_the_future

  private

  def hire_date_limit_in_the_future
    if hire_date_limit.present?
      if hire_date_limit < Date.current
        errors.add(:hire_date_limit, 'não pode ser em datas passadas')
      end
    end
  end
end