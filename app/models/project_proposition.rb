class ProjectProposition < ApplicationRecord
  belongs_to :dev
  belongs_to :project

  validates :motivation, :expected_payment, :available_hours_per_week, :expectations, presence: true
  validates :available_hours_per_week, :expected_payment, numericality: {greater_than: 0}
  validate :cannot_create_cancel_motivation_in_project_proposition_three_days_after_accepted

  enum status: { pending: 0, accepted: 10, rejected: 20 }

  private

  
  def cannot_create_cancel_motivation_in_project_proposition_three_days_after_accepted
    if accepted_time.present? && (Date.today - 3.days) > accepted_time
      errors.add(:cancel_motive, 'não pode ser feito três dias após o aceite')
    end
  end

  def rejection_motive_must_be_present_if_proposition_is_denied
    if rejection_motive.blank?
      if status == 'rejected'
        errors.add(:status, 'deve ser fornecido')
      end 
    end
  end
end
