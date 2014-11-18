class AddGirlIdToProduct < ActiveRecord::Migration
  def change
    add_column :products, :girl_id, :integer
  end
end
