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
    ##-- Validations -----------------
    validates :package_id, presence: true
    validates :user_id, presence: true
    validates :refund_percent, presence: true

    ##-- Callbacks -------------------
    

    ##-- Associations ----------------
    has_many :packagings, dependent: :destroy
    has_many :users, trough: :packagings

    ##-- Methods----------------


end
