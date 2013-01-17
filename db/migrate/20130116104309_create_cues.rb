class CreateCues < ActiveRecord::Migration
  def change
    create_table :cues do |t|
      t.integer :project_id
      t.string :title
      t.integer :number
      t.boolean :approved, default: false
      t.timestamps
    end
    
    add_index :cues, :project_id
    add_index :cues, :number
  end
end
