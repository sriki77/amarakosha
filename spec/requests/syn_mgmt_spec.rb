require 'spec_helper'

describe "Synonym Retrievals" do

  before(:each) do
    FactoryGirl.create(:synonym)
  end

  it "should support only JSON format " do
    get "/syn", {:w => 'abcd'}
    response.body.should == "Only JSON format supported"
  end

  it "should return emty JSON when synonym is not found" do
    get "/syn", {:w => 'abcd', :format => :json}
    response.body.should == "{}"
  end

  it "should return JSON for synonym hari!" do
    get "/syn", {:w => 'हरि: ॐ', :format => :json}
    response.body.should include('"details":"Greeting Words","words":"Hello,Hola,Ni Hau, Namaskara, हरि: ॐ"')
  end

  it "should not return JSON for synonym Hau!" do
    get "/syn", {:w => 'Hau', :format => :json}
    response.body.should_not include('"details":"Greeting Words","words":"Hello,Hola,Ni Hau, Namaskara, हरि: ॐ"')
  end

end
