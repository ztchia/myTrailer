class PostsController < ApplicationController
before_action :set_post, only: [:show, :edit, :update, :destroy]	
	
	def new
		@post = Post.new
	end

	def create

		@post = current_user.posts.new(post_attributes)
		if @post.save
      		redirect_to @post
    	else 
      		render :json => [{:error => "custom_failure"}], :status => 304
    	end
		# if @post.save
		# 	redirect_to action: "show", id: @post.id
		# end
	end

	def show
	end

	def index
		@posts = Post.all
	end

	def edit
	end

	def update
		if @post.update(post_attributes)
     		redirect_to @post
    	end
	end

	def destroy
		@post.delete!
		redirect_to "/"
	end

private
	def set_post
		@post = Post.find(params[:id])
	end

	def post_attributes
		params.require(:post).permit(:user_id, :title, :content, :image, :video, :song) 
	end
end
