class ProfilesController < ApplicationController
	before_action :authenticate_user!, only: [:edit, :update]

	def show
	    @user = User.find_by_username(params[:id])
	    @user ||= current_user
	end

	def edit 
		@user = User.find_by_username(params[:id])
		@user ||= current_user
	end

	def update
		@user = User.find_by_username(params[:id])
		@user ||= current_user

	    if @user.profile.update_attributes(user_params)
	      # Handle a successful update.
	      redirect_to profile_path, notice: 'Votre profil a bien été mis-à-jour'
	    else
	      render 'edit'
	    end
	end

	private

	def user_params
      	params.require(:profile).permit(:avatar)
    end
end
