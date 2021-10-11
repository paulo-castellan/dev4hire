class AddWorkTypeRefToProjects < ActiveRecord::Migration[5.2]
  def change
    add_reference :projects, :work_type, foreign_key: true
  end
end
