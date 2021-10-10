class AddExpertiseRefToDevProfile < ActiveRecord::Migration[5.2]
  def change
    add_reference :dev_profiles, :expertise, foreign_key: true
  end
end
