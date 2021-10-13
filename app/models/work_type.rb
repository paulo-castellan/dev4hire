class WorkType < ApplicationRecord
  validates :description, presence: true
  
  has_many :projects
end
