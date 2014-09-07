class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text     "an_answer"
      t.datetime "created_at"
      t.datetime "updated_at"

    end
  end
end
