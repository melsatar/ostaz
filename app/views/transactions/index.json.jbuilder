json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :from_account_id, :to_account_id, :t_amount, :t_date, :t_desc
  json.url transaction_url(transaction, format: :json)
end
