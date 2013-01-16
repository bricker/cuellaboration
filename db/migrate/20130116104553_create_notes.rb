class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :notable_type
      t.integer :notable_id
      t.integer :collaborator_id
      t.text :body
      t.timestamps
    end
    
    add_index :notes, [:notable_type, :notable_id]
    add_index :notes, :collaborator_id
  end
end
