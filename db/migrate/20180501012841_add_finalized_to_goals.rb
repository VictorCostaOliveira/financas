class AddFinalizedToGoals < ActiveRecord::Migration[5.1]
  def up
    add_column :goals, :finalized, :boolean, default: false
  end

  def down
    remove_column :goals, :finalized
  end
end
