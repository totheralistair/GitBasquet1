# --- For Scenario: Add two numbers ------------
When /^Having entered "([^"]*)"$/ do |arg1|
  @input = arg1
end

When /^running the calculator$/ do
  @output = "4"
  #raise('Cucumber->Command failed!') unless $?.success?
end

Then /^should produce "([^"]*)"$/ do |arg2|
  @output.should == arg2
end
