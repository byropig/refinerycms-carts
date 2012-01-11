Given /^I have no carts$/ do
  Cart.delete_all
end


Then /^I should have ([0-9]+) carts?$/ do |count|
  Cart.count.should == count.to_i
end
