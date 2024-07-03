class CreateLocationInformations < ActiveRecord::Migration[7.1]
  def change
    create_table :location_informations do |t|
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
