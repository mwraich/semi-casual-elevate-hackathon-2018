class AddMasterCategoryColumnToPrograms < ActiveRecord::Migration[5.2]
  def change
    add_column :programs, :master_category, :string
  end
end
