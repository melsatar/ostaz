require 'spec_helper'

describe OthersController do

  describe "GET 'search'" do
    it "returns http success" do
      get 'search'
      response.should be_success
    end
  end

  describe "GET 'assign'" do
    it "returns http success" do
      get 'assign'
      response.should be_success
    end
  end

end
