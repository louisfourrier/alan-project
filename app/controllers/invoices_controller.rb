# == Schema Information
#
# Table name: invoices
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  emission_date :date
#  begin_date    :date
#  end_date      :date
#  amount_ht     :float
#  amount_ttc    :float
#  paid_status   :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class InvoicesController < ApplicationController
  before_action :authenticate_user
  before_action :set_current_user

  before_action :set_invoice, only: [:show, :edit, :update, :destroy]
  layout 'administration'

  # GET /invoices
  def index
    @invoices = Invoice.all
  end

  # GET /invoices/1
  def show
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  def create
    @invoice = Invoice.new(invoice_params)

    if @invoice.save
      redirect_to @invoice, notice: 'Invoice was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /invoices/1
  def update
    if @invoice.update(invoice_params)
      redirect_to @invoice, notice: 'Invoice was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /invoices/1
  def destroy
    @invoice.destroy
    redirect_to invoices_url, notice: 'Invoice was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def invoice_params
      params.require(:invoice).permit(:user_id, :emission_date, :begin_date, :end_date, :amount_ht, :amount_ttc, :paid_status)
    end
end
