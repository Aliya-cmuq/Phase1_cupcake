require 'spec_helper'

describe "customer_cupcakes/new" do
  before(:each) do
    assign(:customer_cupcake, stub_model(CustomerCupcake,
      :name => "MyString",
      :size => "MyString",
      :flavor => "MyString",
      :icing => "MyString",
      :additional_topping => "MyString").as_new_record)
  end
  it "renders new customer_cupcake form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => customer_cupcakes_path, :method => "post" do
      assert_select "input#customer_cupcake_name", :name => "customer_cupcake[name]"
      #assert_select "input#customer_cupcake_size", :name => "customer_cupcake[size]"
      #assert_select "input#customer_cupcake_flavor", :name => "customer_cupcake[flavor]"
      #assert_select "input#customer_cupcake_icing", :name => "customer_cupcake[icing]"
      assert_select "input#customer_cupcake_additional_topping", :name => "customer_cupcake[additional_topping]"
    end
  end
end