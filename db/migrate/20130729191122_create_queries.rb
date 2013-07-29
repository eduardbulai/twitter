class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.string :query_term
      t.reference :user

      t.timestamps
    end
  end
end
