class AddImagePathToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :image_path, :string
  end
end
