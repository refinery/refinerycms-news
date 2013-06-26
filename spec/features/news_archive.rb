require "spec_helper"

describe "manage news items" do
  before do
    date = "dec/2011"
    @time = Time.parse(date)
  end

  it "should display proper date" do
    @time.should == "dec/2011"
  end
end
