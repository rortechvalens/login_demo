class LoginController < ApplicationController
  def new
  end

  #controller/method : Login/Create
  #method use : To Authenticate user by is mail and password.
  #Output : Redirect to profile page when user authenticate successfully flash message appear on login page.
  def create
   user = User.authenticate(params[:user][:email], params[:user][:password])
    if user
      UserMailer.welcome_email(user).deliver
      session[:user_id] = user.id
      redirect_to :action => "welcome", :id => session[:user_id]
    else
      flash.now.alert = "Invalid email or password"
      render "new"
   end
  end


  #controller/method : Login/welcome
  #method use : To show profile of user by its id
  #Output : Contain user details in instance variable to show user detail.
  def welcome
    @user = User.find(params[:id])
  end

  
  #controller/method : Login/destroy
  #method use : Destroy user current session when user attempt for logout
  #Output : redirect user to logout successful confirmation page.
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
  
end

