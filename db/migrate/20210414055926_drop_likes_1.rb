class DropLikes1 < ActiveRecord::Migration[6.0]
  def change
    drop_table :likes
  end
end
