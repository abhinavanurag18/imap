class AddCityToIpAddress < ActiveRecord::Migration
  def change
    change_column :ip_addresses, :city, :string
  end
end
