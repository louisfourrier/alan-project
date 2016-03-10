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

class EmployeesController < ApplicationController
  before_action :authenticate_user, except: [:complete_profile]
  before_action :set_current_user, except: [:complete_profile]

  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  layout 'administration'

  # GET /employees
  def index
    @employees = @user.employees.search_and_paginate(params)
  end

  # GET /employees/1
  def show

  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  def create
    @employee = @user.employees.build(employee_params)

    if @employee.save
      redirect_to user_employee_path(@user, @employee), notice: 'Votre nouvel assuré a été enregistré avec succès. Un email sera envoyé pour compléter son profil'
    else
      render :new
    end
  end

  # PATCH/PUT /employees/1
  def update
    if @employee.update(employee_params)
      redirect_to user_employee_path(current_user, @employee), notice: "Les informations de base sur l'assuré ont été mises à jour"
    else
      render :edit
    end
  end

  # DELETE /employees/1
  def destroy
    @employee.destroy
    redirect_to user_employees_path(current_user), notice: 'Employé supprimé de vos assurés'
  end

  # New route to send a new email of inscription for the employee. Respond in JS
  def send_new_inscription_email
    @employee.send_complete_information_email
    respond_to do |format|
      format.js
    end
  end

  # Route for the complete profile function
  def complete_profile
    @user = User.find_by(id: params[:user_id])
    @employee = Employee.find_by(id: params[:id])

    if (!@user.nil?) & (!@employee.nil?)
      if @employee.correct_access_token(params)
        @employee.has_completed_information
      else
        redirect_to root_path, notice: "Impossible d'accèder à la page"
      end
    else
      redirect_to root_path, notice: "Impossible d'accèder à la page"
    end
    render :layout => 'application'

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    def set_user
      if current_user
        @user = current_user
      else
        redirect_to root_path, notice: "Vous devez être connecté afin de consulter cette page"
      end
    end

    # Only allow a trusted parameter "white list" through.
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :user_id, :birthday_date, :health_comment, :admin_status, :complete_information, :email)
    end
end
