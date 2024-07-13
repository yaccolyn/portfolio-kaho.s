class ChangeLocationInformationIdToBeNullableInPosts < ActiveRecord::Migration[7.1]
  def change
    change_column_null :posts, :location_information_id, true
  end
end
