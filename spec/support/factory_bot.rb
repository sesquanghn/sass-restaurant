RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    DatabaseCleaner.start
    FactoryBot.lint verbose: true
  ensure

    DatabaseCleaner.clean
  end
end
