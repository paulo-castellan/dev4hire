class AddProjectRefToProjectPropositions < ActiveRecord::Migration[5.2]
  def change
    add_reference :project_propositions, :project, foreign_key: true
  end
end
