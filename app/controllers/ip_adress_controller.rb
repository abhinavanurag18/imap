class IpAdressController < ApplicationController
	before_action :set_ip_adress, only: [:show, :edit, :update, :destroy]

  # GET /ip_adresses
  # GET /ip_adresses.json
  def index
    @ip_adresses = IpAddress.all
  end

  # GET /ip_adresses/1
  # GET /ip_adresses/1.json
  def show
  end

  # GET /ip_adresses/new
  def new
    @ip_adress = IpAddress.new
  end

  # GET /ip_adresses/1/edit
  def edit
  end

  # POST /ip_adresses
  # POST /ip_adresses.json
  def create
    @ip_adress = IpAddress.new(ip_adress_params)

    respond_to do |format|
      if @ip_adress.save
        format.html { redirect_to @ip_adress, notice: 'Ip adress was successfully created.' }
        format.json { render :show, status: :created, location: @ip_adress }
      else
        format.html { render :new }
        format.json { render json: @ip_adress.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ip_adresses/1
  # PATCH/PUT /ip_adresses/1.json
  def update
    respond_to do |format|
      if @ip_adress.update(ip_adress_params)
        format.html { redirect_to @ip_adress, notice: 'Ip adress was successfully updated.' }
        format.json { render :show, status: :ok, location: @ip_adress }
      else
        format.html { render :edit }
        format.json { render json: @ip_adress.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ip_adresses/1
  # DELETE /ip_adresses/1.json
  def destroy
    @ip_adress.destroy
    respond_to do |format|
      format.html { redirect_to ip_adresses_url, notice: 'Ip adress was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ip_adress
      @ip_adress = IpAddress.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ip_adress_params
      params[:ip_adress]
    end
end
