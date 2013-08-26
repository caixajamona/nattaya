class PostsController < ApplicationController
	def index
		@posts = Post.order(:created_at).reverse
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(create_params)

		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(update_params)
			redirect_to @post
		else
	    	render 'edit'
		end
	end

  private 
	def create_params
		params.require(:post).permit(
			:title, :text
		)
	end
	def update_params
		params.require(:post).permit(
			:title, :text
		)
	end
end
