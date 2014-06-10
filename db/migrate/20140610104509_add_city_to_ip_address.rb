class AddCityToIpAddress < ActiveRecord::Migration
  def change
    add_column :ip_addresses, :city, :string
  end
end
