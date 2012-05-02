require File.dirname(__FILE__) + '/../spec_helper'

describe ThreadsController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => Thread.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Thread.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Thread.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(thread_url(assigns[:thread]))
  end

  it "edit action should render edit template" do
    get :edit, :id => Thread.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    Thread.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Thread.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Thread.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Thread.first
    response.should redirect_to(thread_url(assigns[:thread]))
  end

  it "destroy action should destroy model and redirect to index action" do
    thread = Thread.first
    delete :destroy, :id => thread
    response.should redirect_to(threads_url)
    Thread.exists?(thread.id).should be_false
  end
end
