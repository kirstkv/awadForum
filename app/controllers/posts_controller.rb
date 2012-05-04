class PostsController < ApplicationController
  before_filter :login_required
  
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
    @post = Post.new(:content => params[:post][:content], :thred_id => params[:post][:thred_id], :user_id => current_user.id)  
    if @post.save
      @thred = Thred.find(@post.thred_id)
      @thred.update_attributes(:last_poster_id => current_user.id, :last_post_at => Time.now)
      flash[:notice] = "Successfully created post."  
      redirect_to "/topics/#{@post.thred_id}"  
    else  
      render :action => 'new'  
    end  
  end  

  def edit
    @post = Post.find(params[:id])
    admin_or_owner_required(@post.user.id)  
  end

  def update
    @post = Post.find(params[:id])
    admin_or_owner_required(@post.user.id)  
    if @post.update_attributes(params[:post])
      @thred = Thred.find(@post.thred_id)
      @thred.update_attributes(:last_poster_id => current_user.id, :last_post_at => Time.now)
      redirect_to @post, :notice  => "Successfully updated post."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    admin_or_owner_required(@post.user.id)  
    @post.destroy
    redirect_to topics_url, :notice => "Successfully destroyed post."
  end
end
