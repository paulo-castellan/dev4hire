class Project < ApplicationRecord
  belongs_to :user

  enum work_type: {remote: 5, presential: 10, mixed: 15}
end
