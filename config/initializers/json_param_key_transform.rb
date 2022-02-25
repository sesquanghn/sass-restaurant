ActionDispatch::Request.parameter_parsers[:json] = ->(raw_json) {
  data = ActiveSupport::JSON.decode(raw_json)
  data = { _json: data } unless data.is_a?(Hash)

  data.deep_transform_keys!(&:underscore)
}
