class ProjectProposition < ApplicationRecord
  belongs_to :dev
  belongs_to :project

  validates :motivation, :expected_payment, :available_hours_per_week, :expectations, presence: true
  validates :available_hours_per_week, :expected_payment, numericality: {greater_than: 0}
end
