# Preview all emails at http://localhost:3000/rails/mailers/employee
class EmployeePreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/employee/complete_profile
  def complete_profile
    Employee.complete_profile
  end

end
