class ThredsController < ApplicationController
  def index
    @threds = Thred.all
  end

  def show
    @thred = Thred.find(params[:id])
  end

  def new
    @thred = Thred.new
  end

  def create
    @thred = Thred.new(params[:thred])
    if @thred.save
      redirect_to @thred, :notice => "Successfully created thred."
    else
      render :action => 'new'
    end
  end

  def edit
    @thred = Thred.find(params[:id])
  end

  def update
    @thred = Thred.find(params[:id])
    if @thred.update_attributes(params[:thred])
      redirect_to @thred, :notice  => "Successfully updated thred."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @thred = Thred.find(params[:id])
    @thred.destroy
    redirect_to threds_url, :notice => "Successfully destroyed thred."
  end
end
