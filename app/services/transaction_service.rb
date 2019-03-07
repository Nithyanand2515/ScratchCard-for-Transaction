class TransactionService

attr_accessor :options

	def initialize(options)
    @options = options
	end

	def perform
		(options[:sender_id].present?) ? updation : list_transaction
	end


private

def list_transaction
Transaction.where(receiver_id: options[:user_id])+Transaction.where(sender_id: options[:user_id])
end

def updation
	Transaction.create!(sender_id: options[:sender_id], receiver_id: options[:receiver_id], amount: options[:amount])
	sender = BankAccount.find_by(user_id: options[:sender_id])
	sender.Balance -= options[:amount]
	sender.save!
	receiver = BankAccount.find_by(user_id: options[:receiver_id])
	receiver.Balance += options[:amount]
	receiver.save!
  scratch_cards = ScratchCardService.new(options[:sender_id], options[:receiver_id], Transaction.last.id).perform
  

end

	end

