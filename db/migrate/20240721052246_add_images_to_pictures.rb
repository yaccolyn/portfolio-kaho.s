class AddImagesToPictures < ActiveRecord::Migration[7.1]
  def change
    add_column :pictures, :images, :json
  end
end
