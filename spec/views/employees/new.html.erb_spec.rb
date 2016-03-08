require 'rails_helper'

RSpec.describe "employees/new", type: :view do
  before(:each) do
    assign(:employee, Employee.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :user => nil,
      :health_comment => "MyText",
      :admin_status => 1,
      :complete_information => false
    ))
  end

  it "renders new employee form" do
    render

    assert_select "form[action=?][method=?]", employees_path, "post" do

      assert_select "input#employee_first_name[name=?]", "employee[first_name]"

      assert_select "input#employee_last_name[name=?]", "employee[last_name]"

      assert_select "input#employee_user_id[name=?]", "employee[user_id]"

      assert_select "textarea#employee_health_comment[name=?]", "employee[health_comment]"

      assert_select "input#employee_admin_status[name=?]", "employee[admin_status]"

      assert_select "input#employee_complete_information[name=?]", "employee[complete_information]"
    end
  end
end
