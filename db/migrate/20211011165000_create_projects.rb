class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :detailed_description
      t.string :skill_sets
      t.decimal :max_payment_per_hour
      t.date :hire_date_limit
      t.references :user, foreign_key: true
      t.references :dev, foreign_key: true

      t.timestamps
    end
  end
end
