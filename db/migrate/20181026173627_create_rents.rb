class CreateRents < ActiveRecord::Migration[5.2]
  def change
    create_table :rents do |t|
      t.Date :start_date, :null => false, :default => ""
      t.Date :end_date, :null => false, default => ""

      t.timestamps
    end
  end
end
