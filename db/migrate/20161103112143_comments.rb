class Comments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.references :commentable, polymorphic: true, index: true
      t.integer :user_id
      t.timestamps
    end
  end
end
