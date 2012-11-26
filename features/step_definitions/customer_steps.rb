Given /^I created a customer and customer_cupcake$/ do
	@aliya = FactoryGirl.create(:customer) 
	@asma = FactoryGirl.create(:customer, :firstName => "Asma", :lastName => "Al-kubaisi", 
	:phone => "97444988831", :email => "asma@asma.com", :address => "PO BOX 128765")
	@choco = FactoryGirl.create(:customer_cupcake, :name => "batata",
	:flavor => "Chocolate", :icing => "Chocolate", :customer_id => @aliya)  
	@vanillaRainbow = FactoryGirl.create(:customer_cupcake, :customer_id => @asma)	
end

When /^I go to the home page$/ do
  visit root_path
end

Then /^I should not see "(.*?)"$/ do |arg1|
  page.should_not have_content arg1
end

Given /^I am in the home page$/ do
  visit root_path
end

When /^I follow the "(.*?)" link$/ do |arg1|
  page.should have_link arg1
  click_link arg1
end

Then /^I should be able to see "(.*?)" in the "(.*?)"$/ do |arg1, arg2|
  page.should have_selector(arg2, :text => arg1) 
end

Then /^I should see "(.*?)" in the "(.*?)"$/ do |arg1, arg2|
  page.should have_selector(arg2, :text => arg1) 
end

When /^I open customers page$/ do
  visit customers_path
end


# Customer: new update delete

When /^I follow the create path$/ do
  visit new_customer_path # express the regexp above with the code you wish you had
end

When /^I follow the update path$/ do
  visit  edit_customer_path# express the regexp above with the code you wish you had
end

When /^I follow the delete path$/ do
  visit customer_path # express the regexp above with the code you wish you had
end


Then /^I should be seeing "(.*?)" as the heading$/ do |arg1|
  page.should have_content arg1 # express the regexp above with the code you wish you had
end

Given /^I am in the customers page$/ do
  visit customers_path # express the regexp above with the code you wish you had
end

When /^I follow the "(.*?)" link for "(.*?)"$/ do |link, cell_value|
  #within do
   # within('tr', :text => cell_value) do
    #  find('th', :text => link).click
    #end
  #end
  find(:xpath, "//tr[contains(.,'#{cell_value}')]").click_link link # express the regexp above with the code you wish you had
end


When /^I follow the cupcake create path$/ do
  visit new_customer_cupcake_path # express the regexp above with the code you wish you had
end

Given /^I follow the new customer path$/ do
  visit new_customer_path
end

When /^I enter "(.*?)" in 'Firstname'$/ do |arg1|
  fill_in 'customer_firstName', :with => arg1
end

When /^I enter "(.*?)" in 'Lastname'$/ do |arg1|
  fill_in 'customer_lastName', :with => arg1
end

When /^I enter "(.*?)" in 'Address'$/ do |arg1|
  fill_in 'customer_address', :with => arg1
end

When /^I enter "(.*?)" in 'Email'$/ do |arg1|
  fill_in 'customer_email', :with => arg1
end

When /^I enter "(.*?)" in 'Phone'$/ do |arg1|
  fill_in 'customer_phone', :with => arg1
end

When /^I click on "(.*?)"$/ do |arg1|
  click_button arg1
end

Then /^I should be seeing "(.*?)"$/ do |arg1|
  page.should have_content arg1
end



Given /^I am in the cupcakes page$/ do
  visit customer_cupcakes_path # express the regexp above with the code you wish you had
end

Given /^I go to the customers page$/ do
  visit customers_path # express the regexp above with the code you wish you had
end

When /^I change the customer_cupcake_name "(.*?)" to "(.*?)"$/ do |arg1, arg2|
  fill_in "customer_cupcake_name", :with => arg2 # express the regexp above with the code you wish you had
end

# cupcake: new update delete
Given /^I follow the new customer cupcake path$/ do
  visit new_customer_cupcake_path
end

When /^I enter "(.*?)" in 'Name'$/ do |arg1|
  fill_in 'customer_cupcake_name', :with => arg1
end

When /^I select "(.*?)" in 'Size'$/ do |arg1|
  select arg1
end

When /^I select "(.*?)" in 'Flavor'$/ do |arg1|
  select arg1
end

When /^I select "(.*?)" in 'Icing'$/ do |arg1|
  select arg1
end

When /^I enter "(.*?)" in 'Additional topping'$/ do |arg1|
  fill_in 'customer_cupcake_additional_topping', :with => arg1
end


Given /^I go to the cupcakes page$/ do
  visit customer_cupcakes_path # express the regexp above with the code you wish you had
end

When /^I change the email address "(.*?)" to "(.*?)"$/ do |arg1, arg2|
    fill_in 'customer_address', :with => arg2
end

When /^I click the button "(.*?)"$/ do |arg1|
  click_button arg1 # express the regexp above with the code you wish you had
end

Then /^in the "(.*?)", I should see "(.*?)"$/ do |arg1, arg2|
  page.should have_css(arg1, :text => arg2) # express the regexp above with the code you wish you had
end

Then /^in the page I should see "(.*?)"$/ do |updated|
  page.should have_content(updated) # express the regexp above with the code you wish you had
end

# When /^I follow the create path$/ do
#   visit new_customer_path
# end
# 
# Then /^I should see "(.*?)", in the "(.*?)"$/ do |arg1, arg2|
#   page.should have_selector(arg2, :text => arg1) 
# end
# 
# Then /^I should see a link "(.*?)", in the "(.*?)"$/ do |arg1, arg2|
#   page.should have_link arg1
# end
# 
# Then /^I should be seeing "(.*?)" as the heading$/ do |arg1|
#    page.should have_content arg1
# end
# 
# When /^I follow the update path$/ do
#   visit edit_customer_path
# end
# 
# When /^I follow the delete path$/ do
#   #visit customer_path
# end
# 
# 
# When /^I follow the create cupcake path$/ do
#   visit new_customer_cupcake_path
# end
# 
# 
# When /^I enter "(.*?)" in "(.*?)"$/ do |arg1, arg2|
# 
# end
# 
# Then /^I should be seeing "(.*?)"$/ do |arg1|
#   page.should have_content arg1
# end
# 
# When /^I open cupcakes page$/ do
#   visit customer_cupcakes_path
# end