class EmployeeMailer < ApplicationMailer
  default reply_to: "Alan <inscription-utilisateur@alan.fr>"
  default from: "Alan <inscription-utilisateur@alan.fr>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.employee.complete_profile.subject
  #

  # Mail when the admin create an user
  def complete_profile(employee)
    @user = employee.user
    @employee = employee

    mail to: @employee.email, subject: "Compléter votre dossier ALAN"
  end



end
