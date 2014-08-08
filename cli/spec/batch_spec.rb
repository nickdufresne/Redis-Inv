require 'spec_helper'

describe Inv::Batch do
  before :all do
    Inv.reset!
  end

  describe :run do
    it "should increment id counter and save json" do
      res = Inv::Batch.new.run
      res.id.should == 1
    end
  end
end