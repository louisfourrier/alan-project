require 'rails_helper'

RSpec.describe "legal_informations/index", type: :view do
  before(:each) do
    assign(:legal_informations, [
      LegalInformation.create!(
        :name => "Name",
        :short_description => "MyText",
        :content => "MyText"
      ),
      LegalInformation.create!(
        :name => "Name",
        :short_description => "MyText",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of legal_informations" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
