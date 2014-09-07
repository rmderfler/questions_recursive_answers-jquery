class ChangeAnswerTableAnswerableAddIndex < ActiveRecord::Migration
  def change

    add_index "answers", ["answerable_id", "answerable_type"], name: "index_answers_on_answerable_id_and_answerable_type", using: :btree
  end
end
