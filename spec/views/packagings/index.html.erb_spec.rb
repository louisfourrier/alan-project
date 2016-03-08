require 'rails_helper'

RSpec.describe "packagings/index", type: :view do
  before(:each) do
    assign(:packagings, [
      Packaging.create!(
        :package => nil,
        :user => nil,
        :refund_percent => 1.5
      ),
      Packaging.create!(
        :package => nil,
        :user => nil,
        :refund_percent => 1.5
      )
    ])
  end

  it "renders a list of packagings" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
