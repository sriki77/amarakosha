require 'spec_helper'

describe Synonym do
  context "It should load all synonyms" do
    it "get all synonmyms" do
      d1=FactoryGirl.create(:synonym)
      Synonym.all.length.should==1
    end
  end
end
