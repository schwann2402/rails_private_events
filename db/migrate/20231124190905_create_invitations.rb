class CreateInvitations < ActiveRecord::Migration[7.1]
  def change
    create_table :invitations do |t|
      t.string :name
      t.references :attendee, null: false, index: true
      t.references :attended_event, null: false, index: true
      t.timestamps
    end
    add_foreign_key :invitations, :users, column: :attendee_id
    add_foreign_key :invitations, :events, column: :attended_event_id
  end
end
