# == Schema Information
#
# Table name: legal_informations
#
#  id                :integer          not null, primary key
#  name              :string
#  short_description :text
#  content           :text
#  publication_date  :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class LegalInformationsController < ApplicationController
  before_action :authenticate_user
  before_action :set_current_user

  before_action :set_legal_information, only: [:show, :edit, :update, :destroy]
  layout 'administration'

  # GET /legal_informations
  def index
    @legal_informations = LegalInformation.all
  end

  # GET /legal_informations/1
  def show
  end

  # GET /legal_informations/new
  def new
    @legal_information = LegalInformation.new
  end

  # GET /legal_informations/1/edit
  def edit
  end

  # POST /legal_informations
  def create
    @legal_information = LegalInformation.new(legal_information_params)

    if @legal_information.save
      redirect_to @legal_information, notice: 'Legal information was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /legal_informations/1
  def update
    if @legal_information.update(legal_information_params)
      redirect_to @legal_information, notice: 'Legal information was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /legal_informations/1
  def destroy
    @legal_information.destroy
    redirect_to legal_informations_url, notice: 'Legal information was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_legal_information
      @legal_information = LegalInformation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def legal_information_params
      params.require(:legal_information).permit(:name, :short_description, :content, :publication_date)
    end
end
