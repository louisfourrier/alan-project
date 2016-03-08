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

RSpec.describe Packaging, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
