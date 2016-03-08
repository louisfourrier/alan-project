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

  # Method for searching and pagination through a collection of employee (must be in the model)
  def self.search_and_paginate(params)
    self.general_search(params).paginate(:page => params[:page], :per_page => 30)
  end

  # General search and ordering for the class
  def self.general_search(attributes)
    attributes.inject(self) do |scope, (key, value)|
      #return scope.scoped if value.blank?
      if value.blank?
        scope.all
      else
          case key.to_sym
          when :name
           name = value.to_s.strip.downcase
           scope.where('employees.first_name ILIKE ? OR employees.last_name ILIKE ? OR employees.email ILIKE ?',  "%#{name}%", "%#{name}%", "%#{name}%")

          when :order # order=field-(ASC|DESC)
            attribute, order = value.split("-")
            if self.column_names.include? attribute.to_s
              scope.order("#{self.table_name}.#{attribute} #{order}")
            else
              scope
            end
          else # unknown key (do nothing or raise error, as you prefer to)
          scope.all
          end

      end
    end
  end

  def full_name
    first_name.to_s + ' ' + last_name.to_s
  end

  def guess_email
    company_domain = self.user.company_domain
    if company_domain
      email = self.first_name.to_s.downcase + "." + self.last_name.to_s.downcase + "@" + company_domain.to_s
      return email
    else
      "Impossible de deviner l'adresse mail, le domaine de l'entreprise n'est pas défini"
    end
  end

  def subscription_date
    return Date.today - 10.day
  end


end
