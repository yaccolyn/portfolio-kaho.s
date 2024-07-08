class ChangeAvatorToAvatarInUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :avator, :avatar
  end
end
