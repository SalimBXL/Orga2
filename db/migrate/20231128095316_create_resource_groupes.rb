class CreateResourceGroupes < ActiveRecord::Migration[7.1]
  def change
    create_table :resource_groupes do |t|
      t.string :name, index: { unique: true }
      t.text :description

      t.timestamps
    end
  end
end
