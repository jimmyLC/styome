class CreateGirlProductships < ActiveRecord::Migration
  def change
    create_table :girl_productships do |t|
      t.integer :girl_id
      t.integer :product_id

      t.timestamps
    end
  end
end
