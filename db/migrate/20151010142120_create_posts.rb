class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|

      t.timestamps
      t.text :comment
      t.string :owner
    end
  end
end
