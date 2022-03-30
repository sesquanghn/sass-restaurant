json.tables do
  json.partial! 'v1/tables/table', collection: @tables, as: :table
end
