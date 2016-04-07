class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.string :name, {null: false}
      t.float :foot_length, {null: false}
      t.float :foot_circumference, {null: false}
    end
  end
end
