class AddImgUrlToProdutos < ActiveRecord::Migration
  def change
    add_column :produtos, :img_url, :string
  end
end
