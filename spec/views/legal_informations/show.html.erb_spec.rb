require 'rails_helper'

RSpec.describe "legal_informations/show", type: :view do
  before(:each) do
    @legal_information = assign(:legal_information, LegalInformation.create!(
      :name => "Name",
      :short_description => "MyText",
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
