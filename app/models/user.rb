# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  first_name             :string
#  last_name              :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  company_name           :string
#  company_domain         :string
#  company_address        :string
#  company_phone          :string
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ##-- Validations -----------------
  validates :first_name, presence: true
  validates :last_name, presence: true

  ##-- Callbacks -------------------
  before_validation :guess_company_domain, if: :company_name_changed?

  ##-- Associations ----------------

  has_many :employees, dependent: :destroy
  has_many :invoices, dependent: :destroy
  has_one :packaging, dependent: :destroy


  ##-- Methods----------------


  # Beautify URLS
  def to_param
  "#{id} #{full_name}".parameterize
  end

  # Basic methods with name
  def full_name
    first_name.to_s + ' ' + last_name.to_s
  end

  # Method that will guess the company domain from the company name.
  def guess_company_domain
    if self.company_domain.blank?
      string = self.company_name.to_s.downcase.gsub(' ', '') + ".fr"
      self.company_domain = string
    end
  end
end
