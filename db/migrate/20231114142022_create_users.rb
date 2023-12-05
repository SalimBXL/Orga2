class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :firstname, null: false
      t.string :lastname, null: false
      
      t.references :groupe, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true

      t.string :phone_office
      t.string :phone_home

      t.boolean :manager, default: false
      t.boolean :inactive, null: false, default: false

      t.timestamps
    end
  end
end
