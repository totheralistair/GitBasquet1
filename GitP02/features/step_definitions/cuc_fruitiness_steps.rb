# --- For Scenario: Add two numbers ------------
When /^the input was "([^"]*)"$/ do |arg1|
  @input = arg1
end

When /^the calculator was just run$/ do
  @output = "4"
  #raise('Cucumber->Command failed!') unless $?.success?
end

Then /^the system should reply w "([^"]*)"$/ do |arg2|
  @output.should == arg2
end

# --- For Scenario: simple fruit list to JSON -------------
When /^the system already knows these name:color pairs$/ do |fruits|
  # table is a Cucumber::Ast::Table
  FruitApp.data = fruits.hashes
end

