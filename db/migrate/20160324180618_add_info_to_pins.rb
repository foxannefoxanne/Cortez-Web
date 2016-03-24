class AddInfoToPins < ActiveRecord::Migration
  def change
    add_column :pins, :info, :text
  end
end
