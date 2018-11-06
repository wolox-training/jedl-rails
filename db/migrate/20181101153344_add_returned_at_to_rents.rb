class AddReturnedAtToRents < ActiveRecord::Migration[5.2]
  def change
    add_column :rents, :returned_at, :date
  end
end
