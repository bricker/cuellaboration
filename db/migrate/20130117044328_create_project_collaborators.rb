class CreateProjectCollaborators < ActiveRecord::Migration
  def change
    create_table :project_collaborators do |t|
      t.integer :project_id
      t.integer :collaborator_id
      t.timestamp
    end
    
    add_index :project_collaborators, :project_id
    add_index :project_collaborators, :collaborator_id
  end
end
