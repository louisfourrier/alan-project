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

class Packaging < ActiveRecord::Base
  belongs_to :package
  belongs_to :user
end
