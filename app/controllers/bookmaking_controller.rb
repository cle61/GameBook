class BookmakingController < ApplicationController
	before_filter :authenticate_user!

	# ----------> Book <----------
	def index
		@books = Book.where(user_id: current_user.id)
		#@books ||= Book.find(1)
	end

	def show
		@book = Book.where(id: params[:id], user_id: current_user.id).take
		@chapters = Chapter.where(book_id: @book.id)
	end

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)

		if @book.save
			redirect_to bookmaking_path(id: @book.id), notice: 'Votre livre a bien été creer'
		else
			render 'new'
		end
	end

	def edit
		@book = Book.where(id: params[:id], user_id: current_user.id).take
		@chapters = Chapter.where(book_id: @book.id)
	end

	def update
		@book = Book.where(id: params[:id], user_id: current_user.id).take

	    if @book.update_attributes(book_params)
	      	redirect_to bookmaking_path(id: @book.id), notice: 'Votre livre à bien été mis-à-jour'
	    else
	      	render 'edit'
	    end
	end

	def destroy
		Book.destroy(params[:id])
		redirect_to bookmaking_index_path, notice: 'Votre livre à bien été supprimer'
	end

	def publish
		@book = Book.where(id: params[:id], user_id: current_user.id).take

		if @book.update_attributes(:publish => true)
	      	redirect_to bookmaking_path(id: @book.id), notice: 'Votre livre à bien été publier'
	    else
	      	render 'show'
	    end
	end


	# ----------> Chapter <----------

	def show_chapter
		@chapter = Chapter.where(id: params[:id], user_id: current_user.id)
		@book = Book.where(id: @chapter.book_id, user_id: current_user.id)
	end

	def new_chapter
		@book = Book.where(id: params[:id], user_id: current_user.id).take
		@chapter = Chapter.new
	end

	def create_chapter
		@chapter = Chapter.new(chapter_params)

		if @chapter.save
			redirect_to bookmaking_path(id: @chapter.book_id), notice: 'Votre chapitre a bien été creer'
		else
			render 'new_chapter'
		end
	end

	def edit_chapter

	end

	def update_chapter

	end

	def destroy_chapter
		@chapter = Chapter.find(params[:id])
		Chapter.destroy(params[:id])
		redirect_to bookmaking_path(id: @chapter.book_id), notice: 'Votre chapitre à bien été supprimer'
	end

	private

    def book_params
      	params.require(:book).permit(:title, :description, :price).merge(user_id: current_user.id)
    end

    def chapter_params
    	@chapters = Chapter.where(book_id: :book_id)
    	@order = 0;
    	@chapters.each do |chapter|
    		if chapter.order > @order
    			@order = chapter.order
    		end
		end

    	params.require(:chapter).permit(:book_id, :nb_chapter, :title, :content).merge(order: @order)
    end
end
