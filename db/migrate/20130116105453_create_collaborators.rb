class CreateCollaborators < ActiveRecord::Migration
  def change
    create_table :collaborators do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :active, default: true
      t.timestamps
    end
    
    add_index :collaborators, [:active, :email]
  end
end
