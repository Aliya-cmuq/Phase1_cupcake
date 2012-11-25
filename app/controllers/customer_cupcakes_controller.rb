class CustomerCupcakesController < ApplicationController
  # GET /customer_cupcakes
  # GET /customer_cupcakes.json
  def index
    @customer_cupcakes = CustomerCupcake.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @customer_cupcakes }
    end
  end

  # GET /customer_cupcakes/1
  # GET /customer_cupcakes/1.json
  def show
    @customer_cupcake = CustomerCupcake.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @customer_cupcake }
    end
  end

  # GET /customer_cupcakes/new
  # GET /customer_cupcakes/new.json
  def new
    @customer_cupcake = CustomerCupcake.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @customer_cupcake }
    end
  end

  # GET /customer_cupcakes/1/edit
  def edit
    @customer_cupcake = CustomerCupcake.find(params[:id])
  end

  # POST /customer_cupcakes
  # POST /customer_cupcakes.json
  def create
    @customer_cupcake = CustomerCupcake.new(params[:customer_cupcake])

    respond_to do |format|
      if @customer_cupcake.save
        format.html { redirect_to @customer_cupcake, notice: 'Customer cupcake was successfully created.' }
        format.json { render json: @customer_cupcake, status: :created, location: @customer_cupcake }
      else
        format.html { render action: "new" }
        format.json { render json: @customer_cupcake.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /customer_cupcakes/1
  # PUT /customer_cupcakes/1.json
  def update
    @customer_cupcake = CustomerCupcake.find(params[:id])

    respond_to do |format|
      if @customer_cupcake.update_attributes(params[:customer_cupcake])
        format.html { redirect_to @customer_cupcake, notice: 'Customer cupcake was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @customer_cupcake.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_cupcakes/1
  # DELETE /customer_cupcakes/1.json
  def destroy
    @customer_cupcake = CustomerCupcake.find(params[:id])
    @customer_cupcake.destroy

    respond_to do |format|
      format.html { redirect_to customer_cupcakes_url }
      format.json { head :no_content }
    end
  end
end
