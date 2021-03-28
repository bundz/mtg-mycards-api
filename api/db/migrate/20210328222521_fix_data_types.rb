class FixDataTypes < ActiveRecord::Migration[6.1]
  def change
    remove_column :cards, :card_type, :string
    add_column :cards, :card_type, :string, array: true, default: []
    
    remove_column :cards, :subtype, :string
    add_column :cards, :subtype, :string, array: true, default: []
    
    remove_column :cards, :supertype, :string
    add_column :cards, :supertype, :string, array: true, default: []
    
    remove_column :cards, :color, :string
    add_column :cards, :color, :string, array: true, default: []
  end
end
