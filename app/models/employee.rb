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
#  complete_information :boolean          default(FALSE)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  research_name        :string
#  email                :string
#  access_token         :string
#

class Employee < ActiveRecord::Base


  ##-- Validations -----------------
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :user_id, presence: true

  ##-- Callbacks -------------------
  before_validation :sanitize_email
  before_validation :update_research_name, if: :name_changed?

  after_create :generate_access_token


  ##-- Associations ----------------
  belongs_to :user # Employee belongs to company that are represented by User here. I agree not a good name for company = User ;)

  ##-- Methods ----------------

  # Beautify URLS
  def to_param
  "#{id} #{full_name}".parameterize
  end

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
           name = I18n.transliterate(value.to_s.downcase.strip).to_s # Just remove the accents and normalize
           scope.where('employees.research_name ILIKE ? OR employees.email ILIKE ?',  "%#{name}%", "%#{name}%", "%#{name}%")

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

  # Full_name method to display the first_name followed by the last_name
  def full_name
    return (first_name.to_s + ' ' + last_name.to_s).strip
  end

  # Method to simualate a Date of subscription. Just For présentation
  #TODO: Remove when progress
  def subscription_date
    return Date.today - 10.day
  end

  # Guess the email of the employee
  def guess_email
    company_domain = self.user.company_domain
    if company_domain
      email = self.first_name.to_s.downcase + "." + self.last_name.to_s.downcase + "@" + company_domain.to_s
      return email
    else
      "Impossible de deviner l'adresse mail, le domaine de l'entreprise n'est pas défini"
    end
  end

  def has_completed_information
    self.update(:complete_information => true)
  end

  

  private

  def sanitize_email
    if !self.email.blank?
      self.email = I18n.transliterate(self.email.to_s.downcase.strip.gsub(' ', '-'))
    end
  end

  # Generate access token to access the page for the Employee. Future development
  def generate_access_token
    if self.access_token.blank?
     self.update_column(:access_token, SecureRandom.urlsafe_base64(nil, false))
    end
  end

  # Update the field used for researching through employee. NOt the best technique I agree but the fastest to have decent results without paying on Heroku
  def update_research_name
    self.research_name = I18n.transliterate(self.full_name.to_s.downcase.strip).to_s
  end

  # Method to know when the research_name must be updated
  def name_changed?
    first_name_changed? || last_name_changed?
  end



end
