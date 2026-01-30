class CreateContacts < ActiveRecord::Migration[8.1]
  def change
    create_table :contacts do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :contact_user_id, null: false

      t.timestamps
    end

    add_foreign_key :contacts, :users, column: :contact_user_id
  end
end
