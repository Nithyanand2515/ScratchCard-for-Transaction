class UsersController < ApplicationController



def index
  user= User.all
  render json: user.map{ |u| u.attributes.merge({bank_account: u.bank_accounts.select(:Account_Number,:IFSC,:Balance,:id)}) }
end
  def create
    user = User.new(user_params)
    user.save!
    render json: user.as_json(only: [:id]) 
  end

  def update
    render json: { message: "updated user id:#{params[:id]}" } if user.update(user_params)
  end

def show
	@user = User.find(params[:id])
	render json: @user.attributes.merge({bank_accounts: @user.bank_accounts})
end
  def destroy
  user = User.find(params[:id])
  user.destroy
  render json: {message: " user id #{params[:id]} deleted sucessfully"}
end



  private
  def user
    User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:Name, :Phone_Number)
  end
end
