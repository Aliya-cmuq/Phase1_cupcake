require 'spec_helper'
require 'factory_girl'
	
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
	#start -- added by asma
  describe "Testing factories" do
	before (:each )do
		@aliya = FactoryGirl.create(:customer) 
		@asma = FactoryGirl.create(:customer, :firstName => "Asma", :lastName => "Al-kubaisi", 
		:phone => "97444988831", :email => "asma@asma.com", :address => "PO BOX 128765")
		@choco = FactoryGirl.create(:customer_cupcake, :name => "Chocolate Cup Cake",
		:flavor => "Chocolate", :icing => "Chocolate", :customer_id => @aliya)  
		@vanillaRainbow = FactoryGirl.create(:customer_cupcake, :customer_id => @asma)
	end

	it "created the factory object correctly" do # This doesn't work yet as the create method saves attributes as nil
		@choco.should be_valid
		@vanillaRainbow.should be_valid
		@choco.name.should == "Chocolate Cup Cake"
		@choco.flavor.should == "Chocolate"
		@choco.icing.should == "Chocolate"
		@choco.customer_id.should == @aliya #check this 
	end	
	
	it "should return the names in alphabetical order" do  # This doesn't work yet as the create method saves attributes as nil
		CustomerCupcake.alphabetical.map{|o| o.name}.should == ["Aliya", "Chocolate Cup Cake"]
	end
	
		 it "should find all cupcakes for a given customer" do  # This doesn't work yet as the create method saves attributes as nil
	CustomerCupcake.for_user(1).map{|o| o.name}.should == ["Chocolate Cup Cake"]
	end
	
  #Asma: "latest(receives number)" validation is not added as we don't have a date attribute to begin with
  #end -- added by asma

	
  end	
end
