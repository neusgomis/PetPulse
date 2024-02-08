class AddAvatarPicToPets < ActiveRecord::Migration[7.1]
  def change
    add_column :pets, :avatar_pic, :string
  end
end
