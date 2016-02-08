class MapsController < ApplicationController
  before_action :set_map, only: [:show, :edit, :update, :destroy]

  # GET /maps
  def index
    @maps = Map.all
  end

  # GET /maps/1
  def show
    @maps = Map.find(params[:id]) 
  end

  # GET /maps/new
  def new
    @map = Map.new
    @map.pins.build
  end

  # GET /maps/1/edit
  def edit
     @hash = Gmaps4rails.build_markers(@pins) do |pin, marker|
      marker.lat pin.latitude
      marker.lng pin.longitude
      marker.title pin.title
      marker.infowindow "beep"
    end 
  end

  # POST /maps
  def create
    @map = Map.new(map_params)

    if @map.save
      redirect_to @map, notice: 'Map was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /maps/1
  def update
    if @map.update(map_params)
      redirect_to @map, notice: 'Map was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /maps/1
  def destroy
    @map.destroy
    redirect_to maps_url, notice: 'Map was successfully destroyed.'
  end

  def home
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_map
      @map = Map.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def map_params
      params.require(:map).permit(:title, :description, pins_attributes: [:title, :description, :address, :latitude, :longitude])
    end
    
end