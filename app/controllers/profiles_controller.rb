class ProfilesController < ApplicationController
  before_action  only: [:show, :edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @profile = Profile.find_by(id: params[:id], user_id: params[:user_id])
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit

    @user = User.find_by(id: params[:user_id])
    @profile = Profile.find(params[:id])
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update

    params.permit!
    @profile = Profile.find(params[:id])
    @profile.update(profile_params)
    redirect_to user_profile_path(:user_id => @profile.user_id, :id => @profile.id)
    # respond_to do |format|
    #   if @profile.update(profile_params)
    #     format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @profile }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @profile.errors, status: :unprocessable_entity }
    #   end
    # end

  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    sign_out
    redirect_to home_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :description, :date_of_birth, :address, :city, :interest, :gender, :user_id, :avatar)
    end
end
