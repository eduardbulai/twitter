class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :word
      t.string :frequency

      t.timestamps
    end
  end
end
