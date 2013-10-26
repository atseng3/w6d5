class SecretsController < ApplicationController
  def new
    @secret = Secret.new
    @user_id = params[:user_id]
    render :new
  end

  def create
    puts params
    @secret = Secret.new(params[:secret])
    if @secret.save
      render :json => @secret
    end
  end
end