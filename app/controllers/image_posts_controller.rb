class ImagePostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  before_action :owner_check, only: [:edit, :update, :destroy]

  def index
    @image_posts = ImagePost.order('created_at DESC')
  end

  def show
  end

  def new
    @image_post = ImagePost.new
  end

  def edit
  end

  def create
    @image_post = ImagePost.new(post_params)
    @image_post.user = current_user
    if params[:back]
      render :new
    else
      if @image_post.save
        ImagePostMailer.image_post_mail(@image_post).deliver
        redirect_to @image_post, notice: "Post Created"
      else
        render 'new'
      end
    end
  end

  def update
    if @image_post.update(post_params)
      flash[:notice] = "Post Updated!"
      redirect_to @image_post
    else
      render 'edit'
    end
  end

  def destroy
    if @image_post.destroy
      flash[:notice] = "Post Deleted!"
      redirect_to image_posts_path
    end
  end

  def confirm
    @image_post = ImagePost.new(post_params)
    @image_post.user = current_user
    render 'new' if @image_post.invalid?
  end

  private

  def set_post
    @image_post = ImagePost.find(params[:id])
  end

  def post_params
    params.require(:image_post).permit(:caption, :image, :image_cache, :user_id)
  end

  def owner_check
    if current_user != @image_post.user
      flash[:alert] = "You can only edit or delete your own posts"
      redirect_to @image_post
    end
  end

end