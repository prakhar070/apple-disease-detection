class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :body
      t.references :commentable, polymorphic: true, index: true
      t.timestamps
    end
    add_index :comments, :commentable_id
  end
end
