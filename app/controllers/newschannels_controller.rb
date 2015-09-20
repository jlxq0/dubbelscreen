class NewschannelsController < ApplicationController
  before_action :set_newschannel, only: [:show, :edit, :update, :destroy]

  # GET /newschannels
  # GET /newschannels.json
  def index
    @user = current_user
    @newschannels = Newschannel.where user_id: current_user.id
  end

  # GET /newschannels/1
  # GET /newschannels/1.json
  def show
    @user = current_user
  end

  # GET /newschannels/new
  def new
    @user = current_user
    @newschannel = Newschannel.new
  end

  # GET /newschannels/1/edit
  def edit
    @user = current_user
  end

  # POST /newschannels
  # POST /newschannels.json
  def create
    @newschannel = Newschannel.new(newschannel_params)
    @newschannel.user_id = current_user.id

    respond_to do |format|
      if @newschannel.save
        format.html { redirect_to [current_user, @newschannel], notice: 'Newschannel was successfully created.' }
        format.json { render :show, status: :created, location: @newschannel }
      else
        format.html { render :new }
        format.json { render json: @newschannel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /newschannels/1
  # PATCH/PUT /newschannels/1.json
  def update
    @newschannel.user_id = current_user.id

    respond_to do |format|
      if @newschannel.update(newschannel_params)
        format.html { redirect_to [current_user, @newschannel], notice: 'Newschannel was successfully updated.' }
        format.json { render :show, status: :ok, location: @newschannel }
      else
        format.html { render :edit }
        format.json { render json: @newschannel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /newschannels/1
  # DELETE /newschannels/1.json
  def destroy
    @newschannel.destroy
    respond_to do |format|
      format.html { redirect_to user_newschannels_url(current_user), notice: 'Newschannel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newschannel
      @newschannel = Newschannel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def newschannel_params
      params.require(:newschannel).permit(:user_id, :name, :feedurl)
    end
end
