class DashboardsController < ApplicationController
  before_action :set_dashboard, only: [:show, :edit, :update, :destroy]

  # GET /dashboards
  # GET /dashboards.json
  def index
    @user = current_user
    @dashboards = Dashboard.where user_id: current_user.id
  end

  # GET /dashboards/1
  # GET /dashboards/1.json
  def show
    @data = @dashboard.data current_user
    render :layout => 'dashboard'
  end

  # GET /dashboards/new
  def new
    @user = current_user
    @dashboard = Dashboard.new
  end

  # GET /dashboards/1/edit
  def edit
    @user = current_user
  end

  # POST /dashboards
  # POST /dashboards.json
  def create
    @dashboard = Dashboard.new(dashboard_params)
    @dashboard.user_id = current_user.id

    respond_to do |format|
      if @dashboard.save
        format.html { redirect_to [current_user, @dashboard], notice: 'Dashboard was successfully created.' }
        format.json { render :show, status: :created, location: @dashboard }
      else
        format.html { render :new }
        format.json { render json: @dashboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dashboards/1
  # PATCH/PUT /dashboards/1.json
  def update
    @dashboard.user_id = current_user.id

    respond_to do |format|
      if @dashboard.update(dashboard_params)
        format.html { redirect_to [current_user, @dashboard], notice: 'Dashboard was successfully updated.' }
        format.json { render :show, status: :ok, location: @dashboard }
      else
        format.html { render :edit }
        format.json { render json: @dashboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dashboards/1
  # DELETE /dashboards/1.json
  def destroy
    @dashboard.destroy
    respond_to do |format|
      format.html { redirect_to user_dashboards_url(current_user), notice: 'Dashboard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dashboard
      @dashboard = Dashboard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dashboard_params
      params.require(:dashboard).permit(:user_id, :name, :content)
    end
end
