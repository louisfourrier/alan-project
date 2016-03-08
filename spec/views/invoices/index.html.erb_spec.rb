require 'rails_helper'

RSpec.describe "invoices/index", type: :view do
  before(:each) do
    assign(:invoices, [
      Invoice.create!(
        :user => nil,
        :amount_ht => 1.5,
        :amount_ttc => 1.5,
        :paid_status => false
      ),
      Invoice.create!(
        :user => nil,
        :amount_ht => 1.5,
        :amount_ttc => 1.5,
        :paid_status => false
      )
    ])
  end

  it "renders a list of invoices" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
