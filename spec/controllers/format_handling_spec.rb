require 'spec_helper.rb'

RSpec.describe DummyBetaController, type: :controller do
  describe "for handling normal requests for HTML" do
    it "should set the flash and redirect when not logged in" do
      @controller.logged_in_user = nil
      get :index
      expect(flash[:alert]).to eq("Login is required to access the requested page.")
      expect(response).to redirect_to("/controller_specified_login")
    end

    it "should set the flash and redirect when unauthorized" do
      @controller.logged_in_user = User.new
      get :index
      expect(flash[:alert]).to eq("Permission denied. You cannot access the requested page.")
      expect(response).to redirect_to("/controller_specified_permission_denied")
    end
  end

  describe "for handling requests for XML" do
    it "should not set the flash and should return a blank body with a 401 code when not logged in" do
      @controller.logged_in_user = nil
      get :index, :format => "xml"
      expect(response).to have_http_status(401)
      expect(response.body).to be_blank
      expect(flash[:alert]).to be_nil
    end

    it "should not set the flash and should return a blank body with a 403 code when unauthorized" do
      @controller.logged_in_user = User.new
      get :index, :format => "xml"
      expect(response).to have_http_status(403)
      expect(response.body).to be_blank
      expect(flash[:alert]).to be_nil
    end
  end

  describe "for handling requests for JSON" do
    it "should not set the flash and should return a blank body with a 401 code when not logged in" do
      @controller.logged_in_user = nil
      get :index, :format => "json"
      expect(response).to have_http_status(401)
      expect(response.body).to be_blank
      expect(flash[:alert]).to be_nil
    end

    it "should not set the flash and should return a blank body with a 403 code when unauthorized" do
      @controller.logged_in_user = User.new
      get :index, :format => "json"
      expect(response).to have_http_status(403)
      expect(response.body).to be_blank
      expect(flash[:alert]).to be_nil
    end
  end

  describe "for handling requests over xhr" do
    it "should not set the flash and should return a blank body with a 401 code when not logged in" do
      @controller.logged_in_user = nil
      get :index, :format => "js", xhr: true
      expect(response).to have_http_status(401)
      expect(response.body).to be_blank
      expect(flash[:alert]).to be_nil
    end

    it "should not set the flash and should return a blank body with a 403 code when unauthorized" do
      @controller.logged_in_user = User.new
      get :index, :format => "js", xhr: true
      expect(response).to have_http_status(403)
      expect(response.body).to be_blank
      expect(flash[:alert]).to be_nil
    end
  end

end
