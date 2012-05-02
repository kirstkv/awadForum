require File.dirname(__FILE__) + '/../spec_helper'

describe Thread do
  it "should be valid" do
    Thread.new.should be_valid
  end
end
