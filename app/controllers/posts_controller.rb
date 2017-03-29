class PostsController < ApplicationController

  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]


  def new
    @group = Group.find(params[:group_id])
    @post = Post.new

    if !current_user.is_member_of?(@group)
      redirect_to group_path(@group), alert: "You need to save this movie before continuing."
    end
  end

  def create
    @group = Group.find(params[:group_id])
    @post = Post.new(post_params)
    @post.group = @group
    @post.user = current_user

    if @post.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def update
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to account_posts_path, notice: "Update Success"
    else
      render :edit
    end
  end

  def edit
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:id])


  end

  def destroy
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:id])
    @post.destroy
    flash[:alert] = "Review deleted"
    redirect_to account_posts_path
  end


    private



    def post_params
      params.require(:post).permit(:content)
    end
  end
