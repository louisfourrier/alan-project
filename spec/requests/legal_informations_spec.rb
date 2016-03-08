# == Schema Information
#
# Table name: legal_informations
#
#  id                :integer          not null, primary key
#  name              :string
#  short_description :text
#  content           :text
#  publication_date  :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'rails_helper'

RSpec.describe "LegalInformations", type: :request do
  describe "GET /legal_informations" do
    it "works! (now write some real specs)" do
      get legal_informations_path
      expect(response).to have_http_status(200)
    end
  end
end
