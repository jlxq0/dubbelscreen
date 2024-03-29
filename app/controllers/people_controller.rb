class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /people
  # GET /people.json
  def index
    @user = current_user
    @people = Person.where user_id: current_user.id
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @user = current_user
  end

  # GET /people/new
  def new
    @user = current_user
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
    @user = current_user
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)
    @person.user_id = current_user.id

    respond_to do |format|
      if @person.save
        format.html { redirect_to [current_user, @person], notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    @person.user_id = current_user.id

    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to [current_user, @person], notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to user_people_url(current_user), notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:user_id, :name, :fullname, :birthday, :withings_id, :withings_key, :withings_secret)
    end
end
