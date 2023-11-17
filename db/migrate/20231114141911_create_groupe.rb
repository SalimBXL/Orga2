class CreateGroupe < ActiveRecord::Migration[7.1]
  def change
    create_table :groupes do |t|
      t.string :name, null: false, index: { unique: true }
      t.text :comment

      t.timestamps
    end
  end
end
