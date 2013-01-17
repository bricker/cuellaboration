class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.integer :cue_id
      t.integer :number
      t.string :media_file
      t.datetime :delivered_at
      t.boolean :finalized, default: false
      t.timestamps
    end
    
    add_index :versions, :cue_id
    add_index :versions, :number
  end
end
