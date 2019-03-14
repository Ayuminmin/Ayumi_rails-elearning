class AddCategoryIdToWords < ActiveRecord::Migration[5.2]
  def change
    add_column :words, :category_id, :integer
  end
end
