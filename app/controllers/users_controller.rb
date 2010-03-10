class UsersController < ApplicationController


  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = current_user
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = 'Registration successfully created.'
      redirect_to root_url
    else
      render :action => "new" 
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = current_user
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User profile was successfully updated.'
        redirect_to root_url
      else
        render :action => "edit" 
      end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
