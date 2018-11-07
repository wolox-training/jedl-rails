class CreateActiveAdminComments < ActiveRecord::Migration::Current
  def self.up
    create_table :active_admin_comments do |t|
      t.string :namespace
      t.text   :body
      t.references :resource, polymorphic: true
      t.references :author, polymorphic: true
      t.timestamps
    end
    add_index :active_admin_comments, [:namespace]

  end

  def self.down
    remove_reference :active_admin_comments, :resource, polymorphic: true
    remove_reference :active_admin_comments, :author, polymorphic: true
    drop_table :active_admin_comments
  end
end
