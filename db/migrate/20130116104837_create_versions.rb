class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.integer :cue_id
      t.integer :version_number
      t.string :media_file
      t.datetime :delivered_at
      t.timestamps
    end
    
    add_index :versions, :cue_id
    add_index :versions, :version_number
  end
end
