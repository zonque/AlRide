RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

# Test::Unit
class Test::Unit::TestCase
  include FactoryBot::Syntax::Methods
end

# Cucumber
World(FactoryBot::Syntax::Methods)

# Spinach
class Spinach::FeatureSteps
  include FactoryBot::Syntax::Methods
end

# MiniTest
class MiniTest::Unit::TestCase
  include FactoryBot::Syntax::Methods
end

# MiniTest::Spec
class MiniTest::Spec
  include FactoryBot::Syntax::Methods
end

# minitest-rails
class MiniTest::Rails::ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
end

