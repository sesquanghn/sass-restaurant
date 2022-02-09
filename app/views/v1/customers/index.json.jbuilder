json.customers do
  json.partial! 'v1/customers/customer', collection: @customers, as: :customer
end

json.partial! 'v1/common/paging', paging: @paging
