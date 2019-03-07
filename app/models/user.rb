class User < ApplicationRecord

	has_many :bank_accounts, dependent: :destroy
	has_many :scratch_cards
end

