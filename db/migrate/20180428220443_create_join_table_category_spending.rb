class CreateJoinTableCategorySpending < ActiveRecord::Migration[5.1]
  def up
    create_join_table :categories, :spendings do |t|
      t.index [:category_id, :spending_id]
      t.index [:spending_id, :category_id]
    end
  end

  def down
    drop_join_table :categories, :spendings
  end
end
