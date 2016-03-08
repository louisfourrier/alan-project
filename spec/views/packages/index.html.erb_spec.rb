require 'rails_helper'

RSpec.describe "packages/index", type: :view do
  before(:each) do
    assign(:packages, [
      Package.create!(
        :name => "Name",
        :month_cost => 1.5
      ),
      Package.create!(
        :name => "Name",
        :month_cost => 1.5
      )
    ])
  end

  it "renders a list of packages" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
