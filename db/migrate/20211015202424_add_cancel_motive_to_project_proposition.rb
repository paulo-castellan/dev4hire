class AddCancelMotiveToProjectProposition < ActiveRecord::Migration[5.2]
  def change
    add_column :project_propositions, :cancel_motive, :string
  end
end
