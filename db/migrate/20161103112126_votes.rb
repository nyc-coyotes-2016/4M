class Votes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value
      t.integer :user_id
      t.references :votable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
