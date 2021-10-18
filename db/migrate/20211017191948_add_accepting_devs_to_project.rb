class AddAcceptingDevsToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :accepting_devs, :integer
  end
end
