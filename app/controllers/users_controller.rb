class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :destroy]


  def show
    @user = User.find(params[:id])
    @tattoos = @user.tattoos
  end

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
      format.csv { render text: @users.to_csv }
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        UserMailer.welcome_email(@user).deliver
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    @user = User.find(params[:id])
    # authorize! :update, @user, :message => 'Not authorized as an administrator.'
    

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to user_path(@user), :notice => "User updated."}
        format.json { respond_with_bip(@user) }
      else
        format.html { render action: "edit"}
        format.json { respond_with_bip(@user) }
      end
    end
    # Works with best_in_place gem
    # if @user.update_attributes(params[:user], :as => :admin)
    #   format.html redirect_to users_path, :notice => "User updated."
    #   format.json { respond_with_bip(@user) }
    # else
    #   format.html redirect_to users_path, :alert => "Unable to update user."
    #   format.json { respond_with_bip(@user) }
    # end
  end
    
  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end

  def change_to_artist
    
  end
end