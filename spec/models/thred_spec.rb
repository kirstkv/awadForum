require File.dirname(__FILE__) + '/../spec_helper'

describe Thred do
  it "should be valid" do
    Thred.new.should be_valid
  end
end
