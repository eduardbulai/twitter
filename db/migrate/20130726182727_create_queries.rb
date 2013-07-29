class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.string :word
      t.integer :frequency

      t.timestamps
    end
  end
end
