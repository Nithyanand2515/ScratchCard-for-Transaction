class BankAccountsController < ApplicationController

def index
  render json: bank_accounts
end
  def create
    bank_account = User.find(params[:user_id]).bank_accounts.create(bank_account_params)
    render json: {bank_account: bank_account, message: "Bank account_number: #{bank_account.Account_Number} created"}, status: :created 
  end
  def show
    render json: bank_account
end

def update
  render json: @bank_account if bank_account.update(bank_account_params)
end
 def destroy
  bank_account.destroy
  render json: {message: "Bank account id #{params[:id]} deleted sucessfully"}
end


  private 
  
  def bank_accounts
    @bank_accounts ||= User.find(params[:user_id]).bank_accounts
  end

  def bank_account
    @bank_account ||= BankAccount.find(params[:id])
  end

  def bank_account_params
    params.require(:bank_account).permit(:Account_Number, :IFSC, :Balance)
  end
end
