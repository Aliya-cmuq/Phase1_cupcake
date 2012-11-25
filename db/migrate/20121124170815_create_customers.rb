class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :firstName
      t.string :lastName
      t.string :address
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
