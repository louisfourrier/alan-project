require 'rails_helper'

RSpec.describe "packagings/new", type: :view do
  before(:each) do
    assign(:packaging, Packaging.new(
      :package => nil,
      :user => nil,
      :refund_percent => 1.5
    ))
  end

  it "renders new packaging form" do
    render

    assert_select "form[action=?][method=?]", packagings_path, "post" do

      assert_select "input#packaging_package_id[name=?]", "packaging[package_id]"

      assert_select "input#packaging_user_id[name=?]", "packaging[user_id]"

      assert_select "input#packaging_refund_percent[name=?]", "packaging[refund_percent]"
    end
  end
end
