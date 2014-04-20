require 'spec_helper'

describe "Synonym Retrievals" do

  before(:each) do
    FactoryGirl.create(:synonym)
  end

  it "should support only JSON format " do
    get "/", {:w => 'abcd'}
    response.body.should == "Only JSON format supported"
  end

  it "should return emty JSON when synonym is not found" do
    get "/", {:w => 'abcd', :format => :json}
    response.body.should == "{}"
  end

  it "should return JSON for synonym hari!" do
    get "/", {:w => 'हरि', :format => :json}
    response.body.should include('"details":"Greeting Words","words":"Hello,Hola,Ni Hau, Namaskara, हरि: ॐ"')
  end


end
