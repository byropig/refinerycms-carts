Given /^I have no line_items$/ do
  LineItem.delete_all
end


Then /^I should have ([0-9]+) line_items?$/ do |count|
  LineItem.count.should == count.to_i
end
