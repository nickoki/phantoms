class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:add_solo, :remove_solo, :edit_solo]

  # GET /songs
  # GET /songs.json
  def index
    @songs = Song.all
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
    @song = Song.find params[:id]
    @user_has_solo = false
    @song.solos.each do |solo|
      if solo.user == current_user
        @user_has_solo = true
        break
      end
    end
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(song_params)

    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url, notice: 'Song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  # Solos
  def add_solo
    @solo = Solo.new
    @song = Song.find params[:id]
    if @song.solos.length > 0
      @song.solos.each do |solo|
        if solo.user.id == current_user.id
          break
        end
        @song.solos.create!(user: current_user, is_active: false)
      end
    else
      @song.solos.create!(user: current_user, is_active: false)
    end

    redirect_to :back
  end

  def edit_solo
    @song = Song.find params[:id]
    @solo = @song.solos.where(user: current_user)[0]
  end

  def update_solo
    @song = Song.find params[:id]
    @solo = @song.solos.where(user: current_user)[0]
    respond_to do |format|
      if @song.solos.update(user: current_user)
        format.html { redirect_to @song, notice: 'Solo was successfully updated.' }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
    @solo.update(is_active: params[:solo][:is_active])

    # redirect_to song_path(@song)
  end

  def remove_solo
    @song = Song.find params[:id]
    @song.solos.where(user: current_user).destroy_all

    redirect_to :back
  end



  # Arrangements
  def add_solo
    @solo = Solo.new
    @song = Song.find params[:id]
    if @song.arrangements.length > 0
      @song.arrangements.each do |solo|
        if solo.user.id == current_user.id
          break
        end
        @song.arrangements.create!(user: current_user, is_active: false)
      end
    else
      @song.arrangements.create!(user: current_user, is_active: false)
    end

    redirect_to :back
  end

  def edit_arrangement
    @song = Song.find params[:id]
    @arrangement = @song.arrangements.where(user: current_user)[0]
  end

  def update_arrangement
    @song = Song.find params[:id]
    @arrangement = @song.arrangements.where(user: current_user)[0]
    respond_to do |format|
      if @song.arrangements.update(user: current_user)
        format.html { redirect_to @song, notice: 'Arrangement was successfully updated.' }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
    @arrangement.update(is_active: params[:arrangement][:is_active])

    # redirect_to song_path(@song)
  end

  def remove_arrangement
    @song = Song.find params[:id]
    @song.arrangements.where(user: current_user).destroy_all

    redirect_to :back
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:title, :artist, :debut_date, :is_active)
    end

end
