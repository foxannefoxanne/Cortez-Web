class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]

  # GET /pins
  def index
     @map = Map.find(params[:map_id])
     @pins = @map.pins.all
     @hash = Gmaps4rails.build_markers(@pins) do |pin, marker|
      marker.lat pin.latitude
      marker.lng pin.longitude
      marker.title pin.title
      info = "<p><b>" + pin.title + "</b><br>" + pin.description + "<br>" + pin.address + 
      "<br><a href='pins/" + pin.id.to_s + "/edit'> Edit </a href>" + "<a href='pins/" + pin.id.to_s + "'> Show </a href> </p>"

      marker.infowindow marker.infowindow info
    end
  end

  # GET /pins/1
  def show
     @map = Map.find(params[:map_id])
     @pin = @map.pins.find(params[:id])
     @pictures = @pin.pictures

  end

  # GET /pins/new
  def new
    @map = Map.find(params[:map_id])
    @pin = @map.pins.build 
    if params[:latitude]
      @pin.latitude = params[:latitude]
    end 
    if params[:longitude]
      @pin.longitude=params[:longitude]
    end
  end

  # GET /pins/1/edit
  def edit
     @map = Map.find(params[:map_id])
     @pin = @map.pins.find(params[:id])
  end

  # POST /pins
  def create
    @map = Map.find(params[:map_id])
    @pin = @map.pins.new(pin_params)
    flash[:notice] = "Here we go!"
    # we'll credit: https://github.com/hackhowtofaq/multiple_file_upload_paperclip_rails/blob/master/app/controllers/galleries_controller.rb
    if @pin.save
      if params[:images]
         params[:images].each { |image| 
           @pin.pictures.create(image: image)}
      end 
      redirect_to map_pins_path(@map)
    else 
      render :new
    end
  end

  # PATCH/PUT /pins/1
  def update
    @map = Map.find(params[:map_id])
    @pin = @map.pins.find(params[:id])

    if @pin.update(pin_params)
        if params[:images]
         params[:images].each { |image| 
           @pin.pictures.create(image: image)}
      end 
      redirect_to map_pins_path(@map)
    else
      render :edit
    end
  end

  # DELETE /pins/1
  def destroy
    @map = Map.find(params[:map_id])
    @pin = @map.pins.find(params[:id])

    @pin.destroy
    redirect_to map_pins_path(@map), notice: 'Pin was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pin_params
      params.require(:pin).permit(:title, :description, :address, :latitude, :longitude, :picture)
    end
end
