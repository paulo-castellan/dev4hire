class AddAcceptedTimeToProjectProposition < ActiveRecord::Migration[5.2]
  def change
    add_column :project_propositions, :accepted_time, :date
  end
end
