class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.string :description
      t.datetime :end_date
      t.float :parcel
      t.float :value

      t.timestamps
    end
  end
end
