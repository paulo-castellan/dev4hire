class AddDescriptionToDevProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :dev_profiles, :description, :string
  end
end
