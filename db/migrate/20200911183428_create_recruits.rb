class CreateRecruits < ActiveRecord::Migration[6.0]
  def change
    create_table :recruits do |t|
      t.string :name,        null:false
      t.integer :contact_id, null:false
      t.string :player_name, null:false
      t.integer :style_id,   null:false
      t.integer :sex_id,     null:false
      t.string :text,        null:false
      t.timestamps
    end
  end
end
