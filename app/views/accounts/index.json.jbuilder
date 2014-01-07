json.array!(@accounts) do |account|
  json.extract! account, :id, :a_name, :a_type, :a_amount
  json.url account_url(account, format: :json)
end
