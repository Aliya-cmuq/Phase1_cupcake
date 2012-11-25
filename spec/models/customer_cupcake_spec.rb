require 'spec_helper'

describe CustomerCupcake do
  describe CustomerCupcake do
    before(:each) do
      @attr = { :name => "Aliya",
                :size => "small ",
                :flavor => "Vanilla",
                :icing => "Vanilla",
                :additional_topping => "chocolate",
                :customer_id => "1"}
    end
    describe "Chack the validation" do
      it {should validate_presence_of(:name)}
    end
    describe "Flavors validation" do  
      describe "Validate good flavor"do
    	  it {should allow_value("RedVelvet").for(:flavor)}
    	  it {should allow_value("Chocolate").for(:flavor)}
    	  it {should allow_value("Vanilla").for(:flavor)}
      end
      describe "Reject bad flavor"do
    	  it {should_not allow_value("blackberry").for(:flavor)}
    	  it {should_not allow_value("caramel").for(:flavor)}
      end
    end
    describe "Icing validation" do  
      describe "Validate good icing"do
    	  it {should allow_value("Strawberry").for(:icing)}
    	  it {should allow_value("Chocolate").for(:icing)}
    	  it {should allow_value("Vanilla").for(:icing)}
      end
      describe "Reject bad icing"do
    	  it {should_not allow_value("blackberry").for(:icing)}
    	  it {should_not allow_value("caramel").for(:icing)}
      end
    end
    describe "Sizing validation" do  
      describe "Validate good sizing"do
    	  it {should allow_value("Mini").for(:size)}
    	  it {should allow_value("Normal").for(:size)}
    	  it {should allow_value("Large").for(:size)}
      end
      describe "Reject bad sizing"do
    	  it {should_not allow_value("small").for(:size)}
    	  it {should_not allow_value("medium").for(:size)}
      end
    end
    describe "Association validation" do
      it "shoud have the correct associations: belong to customer" do
        should belong_to (:customer)
      end
    end
end

end