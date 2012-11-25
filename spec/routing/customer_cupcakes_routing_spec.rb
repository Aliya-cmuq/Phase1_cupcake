require "spec_helper"

describe CustomerCupcakesController do
  describe "routing" do

    it "routes to #index" do
      get("/customer_cupcakes").should route_to("customer_cupcakes#index")
    end

    it "routes to #new" do
      get("/customer_cupcakes/new").should route_to("customer_cupcakes#new")
    end

    it "routes to #show" do
      get("/customer_cupcakes/1").should route_to("customer_cupcakes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/customer_cupcakes/1/edit").should route_to("customer_cupcakes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/customer_cupcakes").should route_to("customer_cupcakes#create")
    end

    it "routes to #update" do
      put("/customer_cupcakes/1").should route_to("customer_cupcakes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/customer_cupcakes/1").should route_to("customer_cupcakes#destroy", :id => "1")
    end

  end
end
