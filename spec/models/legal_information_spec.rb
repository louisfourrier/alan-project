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

RSpec.describe LegalInformation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
