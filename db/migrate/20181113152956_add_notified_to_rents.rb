class AddNotifiedToRents < ActiveRecord::Migration[5.2]
  def up
    add_column :rents, :notified, :boolean, default: false
  end

  def down
    remove_column :rents, :notified
  end
end
