class AddLinkToProgram < ActiveRecord::Migration[5.2]
  def change
    add_column :programs, :link, :string
  end
end
