class UsersController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    
  end

  def new
    @user = User.new 
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
    @prototypes =  @user.prototypes
  end
  
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  private
  def prototype_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  
end
