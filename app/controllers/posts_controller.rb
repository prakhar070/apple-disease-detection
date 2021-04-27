#controller to manage all the posts
class PostsController < ApplicationController
  #this ensures that the user should be allowed any post related activity once he is logged in
  #before_action :authorized

  def index
    #fetch all the posts
    #first the posts should be sorted according to the time they were created
    #@posts = Post.paginate(page: params[:page]).order([:created_at]).reverse_order
    #also passed an empty post object for the form present in the timeline
    @post = Post.new

    @latest = Post.last
    @image = Post.last.image
    print "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    print "\n"
    print @latest.caption
  end

  def create
    #create a new Post
    @post = Post.new(post_params)
    image_path = post_params["image"].original_filename
    print "###########################################################################"
    print "\n"
    print image_path
    print "\n"
    print "################################################################################"
    @post.caption = `python lib/assets/predict.py "#{image_path}"`
    @post.user_id = 1

    if @post.save
      redirect_to root_path
    else
      @posts = Post.paginate(page: params[:page]).order([:created_at]).reverse_order
      render :index
    end
  end

  # def edit
  #   @post = Post.find(params[:id])
  # end

  # def update
  #   #update an existing Post
  #   @post = Post.find(params[:id])
  #   if @post.update(post_params)
  #     redirect_to root_path
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   #destory an existing Post
  #   @post = Post.find(params[:id])
  #   @post.destroy
  #   redirect_to root_path
  # end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end
end
