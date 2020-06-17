class CreatePortifolios < ActiveRecord::Migration[6.0]
  def change
    create_table :portifolios do |t|
      t.string :link
      t.references :developer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
