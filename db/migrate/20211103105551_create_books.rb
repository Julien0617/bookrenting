class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books, id: :uuid do |t|
      t.string :name
      t.string :author_name
      t.string :description
      t.string :gender
      t.boolean :is_rental, default: false
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :rental, class: "User", type: :uuid 

      t.timestamps
    end
  end
end
