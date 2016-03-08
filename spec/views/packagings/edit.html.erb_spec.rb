require 'rails_helper'

RSpec.describe "packagings/edit", type: :view do
  before(:each) do
    @packaging = assign(:packaging, Packaging.create!(
      :package => nil,
      :user => nil,
      :refund_percent => 1.5
    ))
  end

  it "renders the edit packaging form" do
    render

    assert_select "form[action=?][method=?]", packaging_path(@packaging), "post" do

      assert_select "input#packaging_package_id[name=?]", "packaging[package_id]"

      assert_select "input#packaging_user_id[name=?]", "packaging[user_id]"

      assert_select "input#packaging_refund_percent[name=?]", "packaging[refund_percent]"
    end
  end
end
