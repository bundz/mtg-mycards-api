class CreateUserCards < ActiveRecord::Migration[6.1]
  def change
    create_table :user_cards do |t|
      t.references :card
      t.references :user
      t.integer :quantity

      t.timestamps
    end
  end
end
