require 'spec_helper.rb'

RSpec.describe DummyGammaController, type: :controller do
  describe "for handling requests for HTML" do
    it "should use controller defined methods to handle login required redirection when available" do
      get :index
      expect(response).to be_success
    end

    it "should use controller defined methods to handle permission denied redirection when available" do
      get :index
      expect(response).to be_success
    end
  end

  describe "for handling requests for XML" do
    it "should use controller defined methods to handle login required redirection when available" do
      get :index, :format => "xml"
      expect(response).to be_success
    end

    it "should use controller defined methods to handle permission denied redirection when available" do
      get :index, :format => "xml"
      expect(response).to be_success
    end
  end

  describe "for handling requests for JSON" do
    it "should use controller defined methods to handle login required redirection when available" do
      get :index, :format => "json"
      expect(response).to be_success
    end

    it "should use controller defined methods to handle permission denied redirection when available" do
      get :index, :format => "json"
      expect(response).to be_success
    end
  end

  describe "for handling requests for JS" do
    it "should use controller defined methods to handle login required redirection when available" do
      get :index, :format => "js"
      expect(response).to be_success
    end

    it "should use controller defined methods to handle permission denied redirection when available" do
      get :index, :format => "js"
      expect(response).to be_success
    end
  end

end
