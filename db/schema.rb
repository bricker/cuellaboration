# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130116105453) do

  create_table "collaborators", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "encrypted_password"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "cues", :force => true do |t|
    t.integer  "project_id"
    t.string   "title"
    t.integer  "cue_number"
    t.boolean  "approved"
    t.boolean  "finalized"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cues", ["approved"], :name => "index_cues_on_approved"
  add_index "cues", ["cue_number"], :name => "index_cues_on_cue_number"
  add_index "cues", ["finalized"], :name => "index_cues_on_finalized"
  add_index "cues", ["project_id"], :name => "index_cues_on_project_id"

  create_table "notes", :force => true do |t|
    t.string   "notable_type"
    t.integer  "notable_id"
    t.integer  "collaborator_id"
    t.text     "body"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "notes", ["collaborator_id"], :name => "index_notes_on_collaborator_id"
  add_index "notes", ["notable_type", "notable_id"], :name => "index_notes_on_notable_type_and_notable_id"

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.string   "media_location"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "versions", :force => true do |t|
    t.integer  "cue_id"
    t.integer  "version_number"
    t.string   "media_file"
    t.datetime "delivered_at"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "versions", ["cue_id"], :name => "index_versions_on_cue_id"
  add_index "versions", ["version_number"], :name => "index_versions_on_version_number"

end
