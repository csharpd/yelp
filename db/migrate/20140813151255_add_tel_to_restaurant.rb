class AddTelToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :tel, :string
  end
end
