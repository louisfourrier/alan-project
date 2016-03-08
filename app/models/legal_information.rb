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

class LegalInformation < ActiveRecord::Base
end
