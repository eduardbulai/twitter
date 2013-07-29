class CreateQueryResults < ActiveRecord::Migration
  def change
    create_table :query_results do |t|
      t.reference :query
      t.string :word
      t.integer :frequency

      t.timestamps
    end
  end
end
