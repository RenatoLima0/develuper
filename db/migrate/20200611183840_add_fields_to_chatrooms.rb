class AddFieldsToChatrooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :chatrooms, :developer, null: false, foreign_key: true
    add_reference :chatrooms, :project, null: false, foreign_key: true
  end
end
