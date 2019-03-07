class CreateBankAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :bank_accounts do |t|
      t.string :Account_Number
      t.string :IFSC
      t.integer :Balance
      t.belongs_to :user, index: true 
      t.timestamps
    end		
  end
end
