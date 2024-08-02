class ChangeLatitudeAndLongtitudeInLocationInformations < ActiveRecord::Migration[7.1]
  def change
    change_column :location_informations, :latitude, :float, default: 0.0
    change_column :location_informations, :longitude, :float, default: 0.0
  end
end
