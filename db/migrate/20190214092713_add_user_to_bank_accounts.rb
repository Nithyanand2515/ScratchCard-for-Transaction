class AddUserToBankAccounts < ActiveRecord::Migration[5.2]
  def change
    add_reference :bank_accounts, :user, foreign_key: true
  end
end
