class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :knitter_id, {null: false}
      t.integer :recipient_id, {null: false}
      t.string :project_name
      t.string :yarn_name
      t.string :yarn_type
      t.string :needle_size
      t.float :swatch_width, {null: false} 
      t.float :swatch_height, {null: false}
      t.integer :swatch_stitch_count, {null: false}
      t.integer :swatch_row_count, {null: false}

      t.timestamps null: false
    end  
  end
end
