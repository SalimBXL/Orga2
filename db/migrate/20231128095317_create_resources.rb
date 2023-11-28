class CreateResources < ActiveRecord::Migration[7.1]
  def change
    create_table :resources do |t|
      t.string :name
      t.text :description
      t.references :service, null: false, foreign_key: true
      #t.references :resource_groupe, null: false, foreign_key: true
      #t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
