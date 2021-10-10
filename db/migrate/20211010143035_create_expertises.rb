class CreateExpertises < ActiveRecord::Migration[5.2]
  def change
    create_table :expertises do |t|
      t.string :field_of_expertise

      t.timestamps
    end
  end
end
