class RemoveAcceptedTimeFromProjectProposition < ActiveRecord::Migration[5.2]
  def change
    remove_column :project_propositions, :accepted_time, :datetime
  end
end
