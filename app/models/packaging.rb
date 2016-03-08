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


  ##-- Validations -----------------
  validates :package_id, presence: true
  validates :user_id, presence: true
  validates :refund_percent, presence: true
  

  ##-- Callbacks -------------------


  ##-- Associations ----------------
  belongs_to :package
  belongs_to :user


  ##-- Methods----------------
end
