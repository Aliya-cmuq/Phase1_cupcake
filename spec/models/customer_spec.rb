require 'spec_helper'
require 'factory_girl'

  describe Customer do
    before(:each) do
      @attr = { :firstName => "Aliya",
                :lastName => "Hashim ",
                :adress => "POBox 12345",
                :phone => "974-44872456",
                :email => "ahashim@example.com"}
    end
    describe "Chack the presence of firts name, last name, email, phone" do
      it {should validate_presence_of(:firstName)}
      it {should validate_presence_of(:lastName)}
      it {should validate_presence_of(:email)}
      it {should validate_presence_of(:phone)}
    end

    describe "Email validation" do
      describe "Validate good email" do
        it {should allow_value("aliya@aliya.com").for(:email)}
        it {should allow_value("aliya123@aliya123.gov").for(:email)}
        it {should allow_value("aliya-hashim-11@aliya.com").for(:email)}
        it {should allow_value("a1990@aliya.org").for(:email)}
      end
      describe "Reject bad email" do
        it {should_not allow_value("aliya.fred.edu").for(:email)}
        it {should_not allow_value("aliya.com").for(:email)}
        it {should_not allow_value("655437.fred.org").for(:email)}
        it {should_not allow_value("aliy,hashim@fred.com").for(:email)}
        it {should_not allow_value("aliy,com").for(:email)}
        it {should_not allow_value("fred").for(:email)}
        it {should_not allow_value("fred@fred,com").for(:email)}
        it {should_not allow_value("fred@fred.uk").for(:email)}
        it {should_not allow_value("aliya hashim@fred.com").for(:email)}
        it {should_not allow_value("fred.fred.com").for(:email)}
      end
    end
    describe "Phone validation" do
      describe "Validate good phone number" do
        it {should allow_value("97497449744").for(:phone)}
        it {should allow_value("974-9744-9744").for(:phone)}
        it {should allow_value("974-97449744").for(:phone)}
        it {should allow_value("97449744").for(:phone)}
        it {should allow_value("9744-9744").for(:phone)}
      end
      describe "Reject bad phone number" do
        it {should_not allow_value("+(974)97449744").for(:phone)}
        it {should_not allow_value("+(974)974-497-44").for(:phone)}
        it {should_not allow_value("9744").for(:phone)}
        it {should_not allow_value("9744qatar").for(:phone)}
        it {should_not allow_value("974-qatar-974").for(:phone)}
        it {should_not allow_value("(974)4").for(:phone)}
      end
    end
      describe "Association validation" do
        it "shoud have the correct associations: have many cutomer_cupcakes" do
          should have_many(:customer_cupcakes)
        end
      end
	  
	  #start -- added by asma
  describe "Testing factories" do
	before (:each )do
		@aliya = FactoryGirl.create(:customer) 
		@asma = FactoryGirl.create(:customer, :firstName => "Asma", :lastName => "Al-kubaisi", 
		:phone => "97444988831", :email => "asma@asma.com", :address => "PO BOX 128765")
	end
	it "created the factory object correctly" do
		@aliya.should be_valid
		@asma.should be_valid
	
	end	
	it "should return the names in alphabetical order" do  # This doesn't work yet as the create method saves attributes as nil
		Customer.alphabetical.map{|o| o.firstName}.should == ["Aliya", "Asma"]
	end
		it "should return the proper name as first_name last_name" do # This doesn't work yet as the create method saves attributes as nil
		@asma.proper_name.should == "Asma Al-kubaisi"
	end
	
  end

  #end -- added by asma
    end

