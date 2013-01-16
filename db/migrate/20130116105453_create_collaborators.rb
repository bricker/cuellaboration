class CreateCollaborators < ActiveRecord::Migration
  def change
    create_table :collaborators do |t|
      t.string :name
      t.string :email
      t.string :encrypted_password
      t.timestamps
    end
  end
end
