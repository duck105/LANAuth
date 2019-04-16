class WelcomeController < ApplicationController
  before_action :authenticate_user! , only: [:index]
  def index
     flash[:notice] = "Hello! Welcome to use CNLab Natwork"
  end
end
