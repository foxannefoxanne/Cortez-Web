class AddPublicToMaps < ActiveRecord::Migration
  def change
    add_column :maps, :ispublic, :bool
  end
end
