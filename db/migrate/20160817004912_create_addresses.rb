class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :addresses_1
      t.string :addresses_2
      t.string :city
      t.string :state
      t.string :zip
      t.integer :employee_id
      t.timestamps null: false
    end
  end
end
