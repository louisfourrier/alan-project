class SearchController < ApplicationController
  before_action :authenticate_user
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  layout 'administration'


  def result
    @query =  params[:query]
  end

  
end
