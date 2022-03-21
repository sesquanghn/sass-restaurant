json.floors do
  json.partial! 'v1/floors/floor', collection: @floors, as: :floor
end
