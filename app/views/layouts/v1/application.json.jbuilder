json.data do
  json.merge! JSON.parse(yield)
end
json.success  @success || true
json.message  @message
json.errors   @errors
json.code     @code || 200
