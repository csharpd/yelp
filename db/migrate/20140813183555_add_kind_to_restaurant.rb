class AddKindToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :kind, :string
  end
end
