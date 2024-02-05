class CreatePets < ActiveRecord::Migration[7.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :breed
      t.string :species
      t.float :weight
      t.integer :age
      t.string :gender
      t.references :user, null: false, foreign_key: true
      t.references :vet, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
