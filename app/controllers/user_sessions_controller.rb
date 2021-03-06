class UserSessionsController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]
 
  def new
	 @user = User.new
  end


  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to(root_url, notice: 'Login successful')
    else
      flash.now[:alert] = 'Login failed'
      render :new
    end
  end

  def destroy
    logout
    flash.now[:alert] = "Desconectad!"
    render action: 'new'
  end
end
