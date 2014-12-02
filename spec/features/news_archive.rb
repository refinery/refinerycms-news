require "spec_helper"

describe "manage news items", :type => :feature do
  before do
    date = "dec/2011"
    @time = Time.parse(date)
  end

  it "should display proper date" do
    expect(@time).to eq("dec/2011")
  end
end
