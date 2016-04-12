class MapsController < ApplicationController
  before_action :set_map, only: [:show, :edit, :update, :destroy]

  # GET /maps
  def index
    if current_user
       @user_id = current_user.id
    else
       @user_id = -1
    end
    @maps = Map.all
  end


  def maps_dump
    if current_user
       @user_id = current_user.id
    else
       @user_id = -1
    end
    @maps = Map.where('(ispublic = 1) OR (user_id = @user_id)')

    render :layout => false
  end 
  
  def map_dump
    if current_user
       @user_id = current_user.id
    else
       @user_id = -1
    end
    @map = Map.find(params[:map_id])
    @pins = @map.pins.all 
    render :layout => false
  end
  

  # GET /maps/1
  def show
     if current_user
       @user_id = current_user.id
    else
       @user_id = -1
    end

    @maps = Map.find(params[:id]) 
  end

  # GET /maps/new
  def new
    @map = Map.new
    if current_user
      @map.user_id = current_user.id
    end 

    @map.pins.build
  end

  # GET /maps/1/edit
  def edit
    if current_user
       @user_id = current_user.id
    else
       @user_id = -1
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
      params.require(:map).permit(:title, :description, :ispublic, :user_id, :public_edit, pins_attributes: [:title, :description, :address, :latitude, :longitude])
    end
    
end
