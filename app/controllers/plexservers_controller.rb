class PlexserversController < ApplicationController
  before_action :set_plexserver, only: [:show, :edit, :update, :destroy]

  # GET /plexservers
  # GET /plexservers.json
  def index
    @user = current_user
    @plexservers = Plexserver.where user_id: current_user.id
  end

  # GET /plexservers/1
  # GET /plexservers/1.json
  def show
    @user = current_user
  end

  # GET /plexservers/new
  def new
    @user = current_user
    @plexserver = Plexserver.new
  end

  # GET /plexservers/1/edit
  def edit
    @user = current_user
  end

  # POST /plexservers
  # POST /plexservers.json
  def create
    @plexserver = Plexserver.new(plexserver_params)
    @plexserver.user_id = current_user.id

    respond_to do |format|
      if @plexserver.save
        format.html { redirect_to [current_user, @plexserver], notice: 'Plexserver was successfully created.' }
        format.json { render :show, status: :created, location: @plexserver }
      else
        format.html { render :new }
        format.json { render json: @plexserver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plexservers/1
  # PATCH/PUT /plexservers/1.json
  def update
    @plexserver = Plexserver.new(plexserver_params)

    respond_to do |format|
      if @plexserver.update(plexserver_params)
        format.html { redirect_to [current_user, @plexserver], notice: 'Plexserver was successfully updated.' }
        format.json { render :show, status: :ok, location: @plexserver }
      else
        format.html { render :edit }
        format.json { render json: @plexserver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plexservers/1
  # DELETE /plexservers/1.json
  def destroy
    @plexserver.destroy
    respond_to do |format|
      format.html { redirect_to user_plexserver_url(current_user), notice: 'Plexserver was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plexserver
      @plexserver = Plexserver.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plexserver_params
      params.require(:plexserver).permit(:user_id, :name, :url, :port, :token, :shows_library, :movies_library)
    end
end
