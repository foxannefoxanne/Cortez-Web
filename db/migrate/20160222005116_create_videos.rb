class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :pin_id

      t.timestamps null: false
    end
  end
end
