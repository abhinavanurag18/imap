json.array!(@ip_adresses) do |ip_adress|
  json.extract! ip_adress, :id
  json.url ip_adress_url(ip_adress, format: :json)
end
