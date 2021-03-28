class FixThoughnessName < ActiveRecord::Migration[6.1]
  def change
    rename_column :cards, :thoughtness, :thoughness
  end
end
