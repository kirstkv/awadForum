class ThredsController < ApplicationController

  def new
    @thred = Thred.new
  end

  def create
    @thred = Thred.new(params[:topic])  
    if @thred.save  
      @thred = Thred.new(:name => params[:topic][:name], :last_poster_id => current_user.id, :last_post_at => Date.now, :forum_id => params[:topic][:forum_id])  
      if @post.save  
        flash[:notice] = "Successfully created thred."  
        redirect_to "/topics/#{@thred.topic_id}"  
      else  
        redirect :action => 'new'
      end
      
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
      redirect_to "/topics/#{@thred.topic_id}", :notice  => "Successfully updated thred."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @thred = Thred.find(params[:id])
    @thred.destroy
         redirect_to "/topics/#{@thred.topic_id}", :notice => "Successfully destroyed thred."
  end
end
