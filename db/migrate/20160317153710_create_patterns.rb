class CreatePatterns < ActiveRecord::Migration
  def change
    create_table :patterns do |t|
      t.integer :project_id, {null: false}
      t.integer :cast_on
      t.integer :toe_increase_stitches
      t.integer :gusset_increase_stitches
      t.integer :number_of_heel_stitches

      t.timestamps null: false
    end  
  end
end
