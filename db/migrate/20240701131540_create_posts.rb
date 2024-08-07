class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :location_information, null: true, foreign_key: true
      t.string :store_name
      t.text :content

      t.timestamps
    end
  end
end

#位置情報作成の時に、t.references :location_information, null: falseに変更
