class AddPinIdToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :pin_id, :integer
  end
end
