require 'rails_helper'

RSpec.describe "legal_informations/edit", type: :view do
  before(:each) do
    @legal_information = assign(:legal_information, LegalInformation.create!(
      :name => "MyString",
      :short_description => "MyText",
      :content => "MyText"
    ))
  end

  it "renders the edit legal_information form" do
    render

    assert_select "form[action=?][method=?]", legal_information_path(@legal_information), "post" do

      assert_select "input#legal_information_name[name=?]", "legal_information[name]"

      assert_select "textarea#legal_information_short_description[name=?]", "legal_information[short_description]"

      assert_select "textarea#legal_information_content[name=?]", "legal_information[content]"
    end
  end
end
