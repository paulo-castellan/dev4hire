class AddDevRefToDevProfile < ActiveRecord::Migration[5.2]
  def change
    add_reference :dev_profiles, :dev, foreign_key: true
  end
end
