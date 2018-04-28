class AddUserReferences < ActiveRecord::Migration[5.1]
  def up
    add_reference :spendings, :user, forgeing_key: true
    add_reference :earnings, :user, forgeing_key: true
    add_reference :goals, :user, forgeing_key: true
  end

  def down
    remove_reference :spendings, :user
    remove_reference :earnings, :user
    remove_reference :goals, :user
  end
end
