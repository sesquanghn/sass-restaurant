json.partial! 'floor', floor: @floor

json.tables do
  json.partial! 'v1/tables/table', collection: @floor.tables, as: :table
end
