class PhantomsController < ApplicationController
  before_action :set_phantom, only: [:show, :edit, :update, :destroy]

  # GET /phantoms
  # GET /phantoms.json
  def index
    @phantoms = Phantom.all
  end

  # GET /phantoms/1
  # GET /phantoms/1.json
  def show
    @phantom = Phantom.find params[:id]
  end

  # GET /phantoms/new
  def new
    @phantom = Phantom.new
  end

  # GET /phantoms/1/edit
  def edit
  end

  # POST /phantoms
  # POST /phantoms.json
  def create
    @phantom = Phantom.create!(phantom_params.merge(user: current_user))
    redirect_to phantom_path(@phantom)
    #
    # respond_to do |format|
    #   if @phantom.save
    #     format.html { redirect_to @phantom, notice: 'Phantom was successfully created.' }
    #     format.json { render :show, status: :created, location: @phantom }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @phantom.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /phantoms/1
  # PATCH/PUT /phantoms/1.json
  def update
    respond_to do |format|
      if @phantom.update(phantom_params)
        format.html { redirect_to @phantom, notice: 'Phantom was successfully updated.' }
        format.json { render :show, status: :ok, location: @phantom }
      else
        format.html { render :edit }
        format.json { render json: @phantom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phantoms/1
  # DELETE /phantoms/1.json
  def destroy
    @phantom.destroy
    respond_to do |format|
      format.html { redirect_to phantoms_url, notice: 'Phantom was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phantom
      @phantom = Phantom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def phantom_params
      params.fetch(:phantom, {})
      params.require(:phantom).permit(:first_name, :last_name, :voice_part, :image_url, :bio, :start_date, :end_date, :is_active)
    end
end
