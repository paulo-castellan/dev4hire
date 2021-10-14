class AddDevRefToProjectProposition < ActiveRecord::Migration[5.2]
  def change
    add_reference :project_propositions, :dev, foreign_key: true
  end
end
