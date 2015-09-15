class Admin::AdminController < ApplicationController
	layout 'admin'

	# before_filter
  	before_filter :require_admin_user

  	# before_action
  	before_action :authenticate_user!

  	def index

  	end
end
