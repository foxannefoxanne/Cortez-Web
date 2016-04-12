class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]

  def pin_dump
    if current_user
       @user_id = current_user.id
    else
       @user_id = -1
    end
    @map = Map.find(params[:map_id])
    if @map.ispublic == 1 || @map.user_id == @user_id
      @pin = @map.pins.find(params[:pin_id])
      @pictures = @pin.pictures
      @audios = @pin.audios
      @videos = @pin.videos
   end 
    render :layout => false
  end 

  # GET /pins
  def index
    if current_user
       @user_id = current_user.id
    else
       @user_id = -1
    end

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
    if current_user
       @user_id = current_user.id
    else
       @user_id = -1
    end
     @map = Map.find(params[:map_id])
     @pin = @map.pins.find(params[:id])
     @pictures = @pin.pictures
     @audios = @pin.audios
     @videos = @pin.videos
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
    if current_user
       @user_id = current_user.id
    else
       @user_id = -1
    end

     @map = Map.find(params[:map_id])
     @pin = @map.pins.find(params[:id])
  end

  # POST /pins
  def create
    @map = Map.find(params[:map_id])
    @pin = @map.pins.new(pin_params)
    # we'll credit: https://github.com/hackhowtofaq/multiple_file_upload_paperclip_rails/blob/master/app/controllers/galleries_controller.rb
    if @pin.save
        if params[:images]
          params[:images].each { |image|
            @pic = @pin.pictures.new(image: image)
            if (!@pic.save)
              flash[:notice] = "Some of your media files were not uploaded correctly"
            end 
            }
        end 
        if params[:aud_clips]
          params[:aud_clips].each { |aud_clip| 
          @aud = @pin.audios.new(aud_clip: aud_clip)
            if (!@aud.save)
              flash[:notice] = "Some of your media files were not uploaded correctly"
            end 
          }       
        end

        if params[:vid_clips]
          params[:vid_clips].each { |vid_clip| 
          @vid = @pin.videos.create(vid_clip: vid_clip)
          if (!@vid.save)
              flash[:notice] = "Some of your media files were not uploaded correctly"
            end 
          }
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
            @pic = @pin.pictures.new(image: image)
            if (!@pic.save)
              flash[:notice] = "Some of your media files were not uploaded correctly"
            end 
            }
          end 
        if params[:aud_clips]
          params[:aud_clips].each { |aud_clip| 
            @aud = @pin.audios.new(aud_clip: aud_clip)
            if (!@aud.save)
              flash[:notice] = "Some of your media files were not uploaded correctly"
            end       
            }
          end 
        if params[:vid_clips]
          params[:vid_clips].each { |vid_clip| 
            @vid = @pin.videos.create(vid_clip: vid_clip)
            if (!@vid.save)
              flash[:notice] = "Some of your media files were not uploaded correctly"
            end 
          }
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

  def editmedia
    if current_user
       @user_id = current_user.id
    else
       @user_id = -1
    end

     @map = Map.find(params[:map_id])
     @pin = @map.pins.find(params[:pin_id])
     @pictures = @pin.pictures
     @audios = @pin.audios
     @videos = @pin.videos

  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pin_params
      params.require(:pin).permit(:title, :description, :address, :latitude, :longitude, :picture, :audio, :video, :info)
    end
end
