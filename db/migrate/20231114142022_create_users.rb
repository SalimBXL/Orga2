class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email, null: false, index: { unique: true }
      t.string :password_digest, null: false
      t.string :firstname, null: false
      t.string :lastname, null: false
      
      t.references :groupe, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true

      t.boolean :administrator, null: false, default: false
      t.boolean :manager, null: false, default: false

      t.string :phone_office
      t.string :phone_home

      t.boolean :inactive, null: false, default: false
      t.timestamp :last_connection

      t.timestamps
    end
  end
end
