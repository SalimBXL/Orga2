class CreateService < ActiveRecord::Migration[7.1]
  def change
    create_table :services do |t|
      t.string :name, null: false
      t.text :comment
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
