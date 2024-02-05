class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.references :pet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
