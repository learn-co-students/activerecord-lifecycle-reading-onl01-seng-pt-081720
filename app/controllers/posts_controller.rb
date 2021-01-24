class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.new(params.require(:post).permit(:title, :description))
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
	end

	def edit
		@post = Post.find(params[:id])
	  end
  

	def update
	  @post = Post.find(params[:id])
	  if @post = Post.update
	  redirect_to post_path(@post)
	  else
		render :edit
	end


	private

	def post_params
		@post.(params.require(:post).permit(:title, :description, :post_status, :author_id))
	end
end
end
