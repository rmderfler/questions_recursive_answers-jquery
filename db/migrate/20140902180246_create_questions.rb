class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string   "a_question"
      t.string   "user_name"
      t.integer  "user_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
