class VehiculesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vehicule, only: [:show, :edit, :update, :destroy]

  # GET /vehicules
  # GET /vehicules.json
  def index
    @vehicules = Vehicule.all
  end

  # GET /vehicules/1
  # GET /vehicules/1.json
  def show
    @vehicule_images = @vehicule.vehicule_images.all
  end

  # GET /vehicules/new
  def new
    @vehicule = Vehicule.new
    @vehicule.vehicule_images.build
    #@new_vehicule_image = @vehicule.vehicule_images.build
  end

  # GET /vehicules/1/edit
  def edit
    #@vehicule_images = @vehicule.vehicule_images
    @vehicule.vehicule_images.build
  end

  # POST /vehicules
  # POST /vehicules.json
  def create
    @vehicule = Vehicule.new(vehicule_params)
    if @vehicule.save
      redirect_to @vehicule, notice: 'Vehicule was successfully created.' 
    else
      render :new 
    end
  end

  # PATCH/PUT /vehicules/1
  # PATCH/PUT /vehicules/1.json
  def update
    respond_to do |format|
      if @vehicule.update(vehicule_params)
        format.html { redirect_to @vehicule, notice: 'Vehicule was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicule }
      else
        format.html { render :edit }
        format.json { render json: @vehicule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicules/1
  # DELETE /vehicules/1.json
  def destroy
    @vehicule.destroy
    respond_to do |format|
      format.html { redirect_to vehicules_url, notice: 'Vehicule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicule
      @vehicule = Vehicule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicule_params
      params.require(:vehicule).permit(:name, :vehicule_type, :info, :display_image, :tv, :bathroom, 
          :dvd_player, :cd_player, :am_fm_radio, :cooler, :nav_system, :sound_system, :wheelchair, :bluetooth, 
          :leather, :seats, vehicule_images_attributes: [:id, :vehicule_id, :photo, :_destroy])
    end
end
