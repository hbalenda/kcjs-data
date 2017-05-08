class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.string :gender
      t.string :offense
      t.string :details
      t.boolean :dv
      t.string :race
      t.integer :year

      t.timestamps
    end
  end
end
