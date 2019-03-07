class ScratchCard < ApplicationRecord

	belongs_to :trans_id, :class_name => "Transaction"
    belongs_to :user

end
