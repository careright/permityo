require 'spec_helper.rb'

# This is mostly to make sure it's all wired up correctly.

RSpec.describe DummyController, type: :controller do
  it "should allow dogooders to do good" do
    get :do_good
    expect(response).to be_successful
    expect(response.body).to eq('done!')
  end

  it "should not allow dogooders to do evil" do
    get :do_evil
    expect(flash[:alert]).to eq("Permission denied. You cannot access the requested page.")
    expect(response).to redirect_to(Rails.application.config.permit_yo.permission_denied_redirection)
  end

  it "should know how to permit? things" do
    @group = Group.new :owner => (@user = User.new)
    expect(DummyController.new.permit?("owner of :group", :user => @user, :group => @group)).to be_truthy
    expect(DummyController.new.permit?("owner of :group", :user => User.new, :group => @group)).to be_falsy
  end
  it "should use instance variables if there" do
    get :have_instance_variables
    expect(response).to be_successful
    expect(response.body).to eq("done!")
  end
end
