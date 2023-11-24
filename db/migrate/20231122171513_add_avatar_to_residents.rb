class AddAvatarToResidents < ActiveRecord::Migration[7.1]
  def change
    add_column :residents, :avatar, :string
  end
end
