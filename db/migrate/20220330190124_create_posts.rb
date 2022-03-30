class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body
      t.text :tags, array: true, default: []
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_column :posts, :ahoy_visit_id, :bigint
    add_index :posts, :ahoy_visit_id
  end
end
