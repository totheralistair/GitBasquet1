Given /^the input "([^"]*)"$/ do |arg1|
  @input = arg1
end
When /^the calculator is run$/ do
  @output = `ruby calc.rb #{@input}`
  raise('Command failed!') unless $?.success?
end
Then /^the output should be "([^"]*)"$/ do |arg2|
  @output.should == arg2

end
