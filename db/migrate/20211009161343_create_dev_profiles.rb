class CreateDevProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :dev_profiles do |t|
      t.string :full_name
      t.string :social_name
      t.date :date_of_birth
      t.string :academic_education
      t.string :previous_experience

      t.timestamps
    end
  end
end
