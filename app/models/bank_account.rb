class BankAccount < ApplicationRecord

belongs_to :user

validates :Account_Number, presence: true

end