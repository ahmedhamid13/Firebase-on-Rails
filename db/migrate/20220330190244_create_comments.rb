class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end

    add_column :comments, :ahoy_visit_id, :bigint
    add_index :comments, :ahoy_visit_id
  end
end
