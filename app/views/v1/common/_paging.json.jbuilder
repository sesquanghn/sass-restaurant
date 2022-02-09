json.paging do
  json.total paging[:count]
  json.page paging[:page]
  json.limit paging[:items]
end
