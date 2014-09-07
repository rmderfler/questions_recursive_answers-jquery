class ChangeAnswerTableAnswerable < ActiveRecord::Migration
  def change
    add_column :answers, :answerable_id, :integer
    add_column :answers, :answerable_type, :string
  end

end
