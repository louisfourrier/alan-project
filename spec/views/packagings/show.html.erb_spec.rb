require 'rails_helper'

RSpec.describe "packagings/show", type: :view do
  before(:each) do
    @packaging = assign(:packaging, Packaging.create!(
      :package => nil,
      :user => nil,
      :refund_percent => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/1.5/)
  end
end
