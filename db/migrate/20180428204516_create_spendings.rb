class CreateSpendings < ActiveRecord::Migration[5.1]
  def change
    create_table :spendings do |t|
      t.string :description
      t.float :value

      t.timestamps
    end
  end
end
