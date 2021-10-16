class AddRejectionMotiveToProjectProposition < ActiveRecord::Migration[5.2]
  def change
    add_column :project_propositions, :rejection_motive, :string
  end
end
