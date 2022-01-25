RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with :truncation
    Apartment::Tenant.drop('test_app') rescue nil

    account = Account.create!(subdomain: 'test_app', company_name: 'Test App')

    Apartment::Tenant.create('test_app')
    Apartment::Tenant.switch('test_app') do
      user = User.create!(email: 'test_email@example.com', password: 'test_password')
      account.update!(owner: user)
    end
  end

  config.before do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before do
    DatabaseCleaner.start
    Apartment::Tenant.switch! 'test_app'
  end

  config.before(type: :request) do
    host!("api.lvh.me")
  end

  config.append_after do
    Apartment::Tenant.reset
    DatabaseCleaner.clean
  end
end
