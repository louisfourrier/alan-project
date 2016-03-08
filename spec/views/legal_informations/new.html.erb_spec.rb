require 'rails_helper'

RSpec.describe "legal_informations/new", type: :view do
  before(:each) do
    assign(:legal_information, LegalInformation.new(
      :name => "MyString",
      :short_description => "MyText",
      :content => "MyText"
    ))
  end

  it "renders new legal_information form" do
    render

    assert_select "form[action=?][method=?]", legal_informations_path, "post" do

      assert_select "input#legal_information_name[name=?]", "legal_information[name]"

      assert_select "textarea#legal_information_short_description[name=?]", "legal_information[short_description]"

      assert_select "textarea#legal_information_content[name=?]", "legal_information[content]"
    end
  end
end
