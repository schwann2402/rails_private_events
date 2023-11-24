class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.string :date
      t.references :creator, null: false

      t.timestamps
    end
  end
end
