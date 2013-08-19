Given /^the input "([^"]*)"$/ do |arg1|
  @input = arg1
end
#
When /^the calculator is run$/ do
  #   whatnot some comment
  @output = `ruby ./src/calc.rb #{@input}`
  raise('Command failed!') unless $?.success?
end
Then /^the output should be "([^"]*)"$/ do |arg2|
  @output.should == arg2

end
