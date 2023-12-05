class CreateResources < ActiveRecord::Migration[7.1]
  def change
    create_table :resources do |t|
      t.string :name, index: { unique: true }
      t.text :description
      t.references :service, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
