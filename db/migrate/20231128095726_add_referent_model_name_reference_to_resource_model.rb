class AddReferentModelNameReferenceToResourceModel < ActiveRecord::Migration[7.1]
  def change
    add_reference :resources, :referent, null: false, foreign_key: { to_table: :users }
    add_reference :resources, :groupe, null: false, foreign_key: { to_table: :resource_groupes }
  end
end
