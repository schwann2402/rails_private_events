class AddCreatorIdToEvents < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :events, :users, column: 'creator_id'
  end
end
