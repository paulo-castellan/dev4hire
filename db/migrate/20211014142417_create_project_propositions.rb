class CreateProjectPropositions < ActiveRecord::Migration[5.2]
  def change
    create_table :project_propositions do |t|
      t.string :motivation
      t.decimal :expected_payment
      t.integer :available_hours_per_week
      t.string :expectations
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
