class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.boolean :is_like
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end

    add_column :likes, :ahoy_visit_id, :bigint
    add_index :likes, :ahoy_visit_id
  end
end
