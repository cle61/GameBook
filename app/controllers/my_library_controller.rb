class MyLibraryController < ApplicationController
	before_filter :authenticate_user!
end
