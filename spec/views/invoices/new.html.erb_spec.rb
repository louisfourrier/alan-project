require 'rails_helper'

RSpec.describe "invoices/new", type: :view do
  before(:each) do
    assign(:invoice, Invoice.new(
      :user => nil,
      :amount_ht => 1.5,
      :amount_ttc => 1.5,
      :paid_status => false
    ))
  end

  it "renders new invoice form" do
    render

    assert_select "form[action=?][method=?]", invoices_path, "post" do

      assert_select "input#invoice_user_id[name=?]", "invoice[user_id]"

      assert_select "input#invoice_amount_ht[name=?]", "invoice[amount_ht]"

      assert_select "input#invoice_amount_ttc[name=?]", "invoice[amount_ttc]"

      assert_select "input#invoice_paid_status[name=?]", "invoice[paid_status]"
    end
  end
end
