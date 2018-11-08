class CreateBookSuggestions < ActiveRecord::Migration[5.2]
  def change
    create_table :book_suggestions do |t|
      t.string :synopsis
      t.float :price
      t.string :author, null: false, default: ''
      t.string :title, null: false, default: ''
      t.string :link, null: false, default: ''
      t.string :editor, null: false, default: ''
      t.string :year, null: false, default: ''

      t.timestamps

      t.references :user, foreign_key: true, null: false
    end

    reversible do |dir|
      dir.down do
        remove_reference :book_suggestions, :user, index: true, foreign_key: true
      end
    end
  end
end
