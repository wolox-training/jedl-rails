class CreateRents < ActiveRecord::Migration[5.2]
  def change
    create_table :rents do |t|
      t.date :start_date, :null => false, :default => Time.now
      t.date :end_date, :null => false, :default => Time.now

      t.timestamps
    end

    add_reference :rents, :user, foreign_key: true, null: false
    add_reference :rents, :book, foreign_key: true, null: false
  end
end
