require 'support/helpers/request_spec_helpers'

RSpec.configure do |config|
  config.include RequestSpecHelpers, type: :request
end
