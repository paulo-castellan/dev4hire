class RemoveDevRefFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_reference :projects, :dev, foreign_key: true
  end
end
