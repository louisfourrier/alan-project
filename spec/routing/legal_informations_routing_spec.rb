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

require "rails_helper"

RSpec.describe LegalInformationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/legal_informations").to route_to("legal_informations#index")
    end

    it "routes to #new" do
      expect(:get => "/legal_informations/new").to route_to("legal_informations#new")
    end

    it "routes to #show" do
      expect(:get => "/legal_informations/1").to route_to("legal_informations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/legal_informations/1/edit").to route_to("legal_informations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/legal_informations").to route_to("legal_informations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/legal_informations/1").to route_to("legal_informations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/legal_informations/1").to route_to("legal_informations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/legal_informations/1").to route_to("legal_informations#destroy", :id => "1")
    end

  end
end
