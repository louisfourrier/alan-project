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

class UsersController < ApplicationController
  before_action :authenticate_user
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  layout 'administration'

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    @employees_count = @user.employees.count
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    # Set the user variable and check that it is the same than the current_user.
    def set_user
      user = User.find_by(id: params[:id])
      if (user.nil?) || (user != current_user)
        redirect_to root_path, notice: "Vous n'êtes pas autorisé à accéder à cette page"
        return
      end
      @user = user
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :refund_percent, :company_name, :company_domain, :company_phone, :company_address)
    end
end
