class CreateRentings < ActiveRecord::Migration[6.1]
  def change
    create_table :rentings, id: :uuid do |t|
      t.belongs_to :user
      t.belongs_to :book 
      t.datetime :rental_start_date
      t.datetime :rental_end_date

      t.timestamps
    end
  end
end
