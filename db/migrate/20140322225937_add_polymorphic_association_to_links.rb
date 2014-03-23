class AddPolymorphicAssociationToLinks < ActiveRecord::Migration
  def change
    change_table :links do |t|
      t.references :linker, polymorphic: true
    end
  end
end
