class AddPostCodeToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :postcode, :string
  end
end
