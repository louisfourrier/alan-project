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

class Package < ActiveRecord::Base
end
