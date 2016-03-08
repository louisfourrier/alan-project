# == Schema Information
#
# Table name: employees
#
#  id                   :integer          not null, primary key
#  first_name           :string
#  last_name            :string
#  user_id              :integer
#  birthday_date        :date
#  health_comment       :text
#  admin_status         :integer
#  complete_information :boolean
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Employee < ActiveRecord::Base


  ##-- Validations -----------------
  validates :first_name, presence: true
  validates :last_name, presence: true # TO prevent duplication
  validates :user_id, presence: true

  ##-- Callbacks -------------------

  ##-- Associations ----------------
  belongs_to :user

  ##-- Methods ----------------

  def full_name
    first_name.to_s + ' ' + last_name.to_s
  end

  def guess_email
    company_domain = self.user.company_domain
    if company_domain
      email = self.first_name.to_s.downcase + "." + self.last_name.to_s.downcase + "@" + company_domain.to_s 
      return email
    else
      "Pas possible de deviner l'adresse mail"
    end
  end

  def subscription_date
    return Date.today - 10.day
  end


end
