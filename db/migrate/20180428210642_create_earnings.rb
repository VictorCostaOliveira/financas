class CreateEarnings < ActiveRecord::Migration[5.1]
  def change
    create_table :earnings do |t|
      t.string :description
      t.float :value

      t.timestamps
    end
  end
end
