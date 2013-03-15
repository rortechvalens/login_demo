class RegistrationController < ApplicationController
  
  #controller/method : Registration/new
  #method use : To create new instance of User object
  #Output : Create user instance and save it to instance variable.
  def new
    @registration = User.new
  end

  #controller/method : Registration/create
  #method use : To save user information in database.
  #Output : On successful registration user redirect to login page else Error messages occur on registration page.
  def create
     @registration = User.new(params[:registraion])
     # UserMailer.welcome_email(@registration).deliver
     respond_to do |format|
       if @registration.save
       
        format.html { redirect_to login_path, :notice => 'Signup Successfully.' }
      else
        format.html { render :action => "new" }
        format.json { render :json =>  @registration.errors }
       end     
    end  
  end
end
