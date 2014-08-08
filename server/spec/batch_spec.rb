require 'spec_helper'

describe Inv::Batch do
  it "should exist" do
    b = Inv::Batch.new
    expect b.is_a?(Inv::Batch)
  end
end