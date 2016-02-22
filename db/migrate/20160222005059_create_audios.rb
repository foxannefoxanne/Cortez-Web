class CreateAudios < ActiveRecord::Migration
  def change
    create_table :audios do |t|
      t.integer :pin_id

      t.timestamps null: false
    end
  end
end
