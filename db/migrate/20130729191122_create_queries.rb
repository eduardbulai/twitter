class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.string :query_term
      t.references :user

      t.timestamps
    end
  end
end
