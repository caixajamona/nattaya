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

  private 
	def create_params
	params.require(:post).permit(
	  :title, :text
	)
	end
end
