class Powerthoughtnessloyaltytodb < ActiveRecord::Migration[6.1]
  def change
    add_column :cards, :power, :string
    add_column :cards, :thoughtness, :string
    add_column :cards, :loyalty, :string
  end
end
