# == Schema Information
#
# Table name: employees
#
#  id                   :integer          not null, primary key
#  first_name           :string
#  last_name            :string
#  user_id              :integer
#  birthday_date        :date
#  health_comment       :text
#  admin_status         :integer
#  complete_information :boolean
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  research_name        :string
#  email                :string
#  access_token         :string
#

require 'rails_helper'

RSpec.describe "Employees", type: :request do
  describe "GET /employees" do
    it "works! (now write some real specs)" do
      get employees_path
      expect(response).to have_http_status(200)
    end
  end
end
