class Transaction < ApplicationRecord

	belongs_to  :sender, :class_name =>"User"
    belongs_to  :receiver, :class_name =>"User"
	has_many :scratch_cards

end
