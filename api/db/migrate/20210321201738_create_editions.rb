class CreateEditions < ActiveRecord::Migration[6.1]
  def change
    create_table :editions do |t|
      t.string :name
      t.date :released_at

      t.timestamps
    end
  end
end
