class CreateAfinns < ActiveRecord::Migration
  def change
    create_table :afinns do |t|
      t.string :term
      t.integer :value

      t.timestamps
    end
    add_index :afinns, :term
  end
end
