class ThreadsController < ApplicationController
  
  def index
    @threads = Thread.all
  end

  def show
    @thread = Thread.find(params[:id])
  end

  def new
    @thread = Thread.new
  end

  def create
    @thread = Thread.new(params[:thread])
    if @thread.save
      redirect_to @thread, :notice => "Successfully created thread."
    else
      render :action => 'new'
    end
  end

  def edit
    @thread = Thread.find(params[:id])
  end

  def update
    @thread = Thread.find(params[:id])
    if @thread.update_attributes(params[:thread])
      redirect_to @thread, :notice  => "Successfully updated thread."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @thread = Thread.find(params[:id])
    @thread.destroy
    redirect_to threads_url, :notice => "Successfully destroyed thread."
  end
  
end
