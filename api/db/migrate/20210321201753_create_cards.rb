class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :description
      t.string :flavor_text
      t.string :mana_cost
      t.string :card_type
      t.string :subtype
      t.string :supertype
      t.string :color
      t.references :edition

      t.timestamps
    end
  end
end
