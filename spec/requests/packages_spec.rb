# == Schema Information
#
# Table name: packages
#
#  id         :integer          not null, primary key
#  name       :string
#  month_cost :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe "Packages", type: :request do
  describe "GET /packages" do
    it "works! (now write some real specs)" do
      get packages_path
      expect(response).to have_http_status(200)
    end
  end
end
