class CreateRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :ratings do |t|
      t.integer :amount
      t.integer :user_id
      t.integer :recipe_id
      t.text :comment

      t.timestamps
    end
  end
end
