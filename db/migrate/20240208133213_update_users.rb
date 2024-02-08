class UpdateUsers < ActiveRecord::Migration[7.1]
  def change
    change_column_default :users, :vet, from: nil, to: false
  end
end
