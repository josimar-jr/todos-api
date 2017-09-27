# require database cleaner at the top level
require 'database_cleaner'

# [...]
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# [...]
# configure shoulda matchers to use rspec as the test framework and full matcher libraries
Shoulda::Matchers.configure do |config|
	config.integrate do |with|
		with.test_framework :rspec
		with.library :rails
	end
end

# [...]
RSpec.configuration do |config|
	# [...]
	# add `FactoryGirl` methods
	config.include FactoryGirl::Syntax::Methods

	# start by truncating all the table but then use the faster transaction strategy the rest of the time
	config.before(:suite) do
		DatabaseCleaner.clean_with(:truncation)
		DatabaseCleaner.strategy = :transaction
	end

	# start the transaction strategy as example as run
	config.around(:each) do |example|
		DatabaseCleaner.cleaning do 
			example.run
		end
	end
	# [...]

end