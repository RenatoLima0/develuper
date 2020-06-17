class AddTitleToPortifolios < ActiveRecord::Migration[6.0]
  def change
    add_column :portifolios, :title, :string
  end
end
