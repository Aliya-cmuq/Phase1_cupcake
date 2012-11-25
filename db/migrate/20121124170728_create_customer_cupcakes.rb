class CreateCustomerCupcakes < ActiveRecord::Migration
  def change
    create_table :customer_cupcakes do |t|
      t.string :name
      t.string :size
      t.string :flavor
      t.string :icing
      t.string :additional_topping
      t.integer :customer_id

      t.timestamps
    end
  end
end
