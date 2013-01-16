class CreateCues < ActiveRecord::Migration
  def change
    create_table :cues do |t|
      t.integer :project_id
      t.string :title
      t.integer :cue_number
      t.boolean :approved
      t.boolean :finalized
      t.timestamps
    end
    
    add_index :cues, :project_id
    add_index :cues, :cue_number
    add_index :cues, :approved
    add_index :cues, :finalized
  end
end
