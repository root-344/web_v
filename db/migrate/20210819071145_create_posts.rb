class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :team_name
      t.integer :genre_id
      t.date :date
      t.text :content
      t.integer :user_id
      
      t.timestamps
    end
  end
end
