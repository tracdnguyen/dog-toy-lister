class AddPriceAndImageUrlToToys < ActiveRecord::Migration[5.2]
  def change
    add_column :toys, :price, :float
    add_column :toys, :image_url, :text
  end
end
