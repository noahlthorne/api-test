class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_post, only: [:show, :destroy, :edit, :update]

  def index
    @posts = policy_scope(Post).order(created_at: :desc).limit(50)
    @users = policy_scope(User)
    @post = Post.new
    # @post = Post.new
    # authorize @post
  end

  def show
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    authorize @post
    if @post.save
      respond_to do |format|
        format.js { flash[:notice] = 'Your post was successfully published' }
        format.html { redirect_to posts_path }
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: 'Your post was successfully updated'
    else
      render :new
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: 'post deleted'
  end

  private

  def set_post
    @post = Post.find(params[:id])
    authorize @post
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
