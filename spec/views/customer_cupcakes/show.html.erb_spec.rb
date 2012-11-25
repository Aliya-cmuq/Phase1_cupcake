require 'spec_helper'

describe "customer_cupcakes/show" do
  before(:each) do
    @customer_cupcake = assign(:customer_cupcake, stub_model(CustomerCupcake,
      :name => "Name",
      :size => "Size",
      :flavor => "Flavor",
      :icing => "Icing",
      :additional_topping => "Additional Topping"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Size/)
    rendered.should match(/Flavor/)
    rendered.should match(/Icing/)
    rendered.should match(/Additional Topping/)
  end
end
