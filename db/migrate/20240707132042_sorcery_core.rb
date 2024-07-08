class SorceryCore < ActiveRecord::Migration[7.1]
  def change
    create_table :users, if_not_exists: true do |t|
      t.string :name, null: false
      t.string :email,            null: false, index: { unique: true }
      t.string :crypted_password
      t.string :salt
      t.string :avatar

      t.timestamps                null: false
    end
  end
end
