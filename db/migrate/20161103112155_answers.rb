class Answers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :body
      t.integer :question_id
      t.integer :user_id
      t.boolean :best_answer
      t.timestamps
    end
  end
end
