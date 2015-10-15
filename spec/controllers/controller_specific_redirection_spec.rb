require 'spec_helper.rb'

RSpec.describe DummyBetaController, type: :controller do
  it "should redirect to a controller specified login required location when present in the controller" do
    @controller.logged_in_user = nil
    get :index
    expect(response).to redirect_to("/controller_specified_login")
  end

  it "should redirect to a controller specified permission denied location when present in the controller" do
    @controller.logged_in_user = User.new
    get :index
    expect(response).to redirect_to("/controller_specified_permission_denied")
  end
end
