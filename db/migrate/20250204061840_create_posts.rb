class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.date :date
      t.integer :weight
      t.integer :step
      t.integer :food
      t.text :text

      t.timestamps
    end
  end
end
