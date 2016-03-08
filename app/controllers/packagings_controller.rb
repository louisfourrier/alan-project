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

class PackagingsController < ApplicationController
  before_action :authenticate_user
  before_action :set_current_user

  before_action :set_packaging, only: [:show, :edit, :update, :destroy]
  layout 'administration'

  # GET /packagings
  def index
    @packagings = Packaging.all
  end

  # GET /packagings/1
  def show
  end

  # GET /packagings/new
  def new
    @packaging = Packaging.new
  end

  # GET /packagings/1/edit
  def edit
  end

  # POST /packagings
  def create
    @packaging = Packaging.new(packaging_params)

    if @packaging.save
      redirect_to @packaging, notice: 'Packaging was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /packagings/1
  def update
    if @packaging.update(packaging_params)
      redirect_to @packaging, notice: 'Packaging was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /packagings/1
  def destroy
    @packaging.destroy
    redirect_to packagings_url, notice: 'Packaging was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_packaging
      @packaging = Packaging.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def packaging_params
      params.require(:packaging).permit(:package_id, :user_id, :refund_percent)
    end
end
