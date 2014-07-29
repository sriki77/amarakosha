require 'spec_helper'

describe UserController do
  before(:each) do
    usr = User.all[0]
    session[:users]=usr
    session[:user_id]=usr.id
  end

  context "When Insufficient information" do

    it "should return 400 for missing users" do
      post :create
      expect(response).to redirect_to(new_user_url)
      response.response_code.should==302
    end

    it "should return 403 for missing users data" do
      post :create, {:users => {}}
      expect(response).to redirect_to(new_user_url)
      response.response_code.should==302
    end

    it "should return 403 for missing users name, password" do
      post :create, {:users => {:email => 'cooker@gmail.com'}}
      expect(response).to redirect_to(new_user_url)
      response.response_code.should==302
    end

    it "should return 403 for missing users password" do
      post :create, {:users => {:email => 'cooker@gmail.com', :name => 'hawkings'}}
      expect(response).to redirect_to(new_user_url)
      response.response_code.should==302
    end
  end

  context "When input is invalid" do

    it "should return 403 if users name length is invalid" do
      post :create, {:users => {:name => 'a', :email => 'a@a.com', :password => 'p', :password_confirmation => 'p'}}
      expect(response).to redirect_to(new_user_url)
      response.response_code.should==302
    end

    it "should return 403 if users exists" do
      user = FactoryGirl.create(:users)
      post :create, {:users => {:email => user.email, :name => user.name, :password => user.password, :password_confirmation => user.password_confirmation}}
      expect(response).to redirect_to(new_user_url)
      response.response_code.should==302
    end
  end

  context "When new valid users" do
    it "Should create the users" do
      user = FactoryGirl.build(:users)
      post :create, {:users => {:email => user.email, :name => user.name, :password => user.password, :password_confirmation => user.password_confirmation}}
      expect(response).to redirect_to(synonym_index_url)
      response.response_code.should==302
    end
  end
end
