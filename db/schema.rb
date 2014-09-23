ActiveRecord::Schema.define(version: 20140923155238) do

  create_table "products", force: true do |t|
    t.string   "title"
    t.decimal  "price",              precision: 8, scale: 2
    t.text     "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
