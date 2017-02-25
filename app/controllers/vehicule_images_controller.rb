class VehiculeImagesController < ApplicationController
  before_action :set_vehicule_image, only: [:show, :edit, :update, :destroy]

  # GET /vehicule_images
  # GET /vehicule_images.json
  def index
    @vehicule_images = VehiculeImage.all
  end

  # GET /vehicule_images/1
  # GET /vehicule_images/1.json
  def show
  end

  # GET /vehicule_images/new
  def new
    @vehicule_image = VehiculeImage.new
  end

  # GET /vehicule_images/1/edit
  def edit
  end

  # POST /vehicule_images
  # POST /vehicule_images.json
  def create
    @vehicule_image = VehiculeImage.new(vehicule_image_params)

    respond_to do |format|
      if @vehicule_image.save
        format.html { redirect_to @vehicule_image, notice: 'Vehicule image was successfully created.' }
        format.json { render :show, status: :created, location: @vehicule_image }
      else
        format.html { render :new }
        format.json { render json: @vehicule_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicule_images/1
  # PATCH/PUT /vehicule_images/1.json
  def update
    respond_to do |format|
      if @vehicule_image.update(vehicule_image_params)
        format.html { redirect_to @vehicule_image.vehicule, notice: 'Vehicule image was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicule_image }
      else
        format.html { render :edit }
        format.json { render json: @vehicule_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicule_images/1
  # DELETE /vehicule_images/1.json
  def destroy
    @vehicule_image.destroy
    respond_to do |format|
      format.html { redirect_to vehicule_images_url, notice: 'Vehicule image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicule_image
      @vehicule_image = VehiculeImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicule_image_params
      params.require(:vehicule_image).permit(:vehicule_id, :photo)
    end
end
