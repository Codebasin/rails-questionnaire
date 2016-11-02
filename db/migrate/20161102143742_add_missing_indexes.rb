class AddMissingIndexes < ActiveRecord::Migration
  def change
    add_index :surveys, :user_id
    add_index :questions, :survey_id
  end
end