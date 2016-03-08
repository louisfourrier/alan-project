# == Schema Information
#
# Table name: packagings
#
#  id             :integer          not null, primary key
#  package_id     :integer
#  user_id        :integer
#  refund_percent :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe "Packagings", type: :request do
  describe "GET /packagings" do
    it "works! (now write some real specs)" do
      get packagings_path
      expect(response).to have_http_status(200)
    end
  end
end
