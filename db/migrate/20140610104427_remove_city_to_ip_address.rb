class RemoveCityToIpAddress < ActiveRecord::Migration
  def change
    remove_column :ip_addresses, :city, :string
  end
end
