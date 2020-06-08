class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.references :project_owner
      t.references :developer
      t.string :title
      t.text :description
      t.string :address
      t.timestamps
    end
  end
end
