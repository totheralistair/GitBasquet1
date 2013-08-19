
# --- For Scenario: simple fruit list to JSON -------------
When /^Making a miniDB w these name:color pairs$/ do |fruits|
  # table is a Cucumber::Ast::Table
  FruitApp.data = fruits.hashes
end

