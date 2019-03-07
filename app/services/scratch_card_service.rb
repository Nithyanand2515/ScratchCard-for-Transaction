class ScratchCardService


  attr_accessor :sender_id, :receiver_id, :transaction_id

	def initialize(sender_id, receiver_id, transaction_id)
    
     @sender_id = sender_id
     @receiver_id = receiver_id
     @transaction_id = transaction_id
   
    end

    def perform
		generate_scratch_card
	end

	private

	def generate_scratch_card
		scratchcard_amount=[]
     senders = Rule.where(type_user: "Sender")
     receivers = Rule.where(type_user: "Receiver")
     transaction = Transaction.find(transaction_id)
     sender_scratch_card = receiver_scratch_card = 0
     
      senders.reverse_each do |sender|
    	 (sender.period.to(-3) == "dai") ? v = "day".to_sym : v = sender.period.to(-3).to_sym	
    	 total_transactions = Transaction.where("created_at >= ?",1.public_send(v).ago).where(sender_id: @sender_id) + Transaction.where("created_at >= ?",1.public_send(v).ago).where(receiver_id: @sender_id)
    	 ((sender.limit > total_transactions.size) and ((sender.min_range < transaction.amount) and (sender.max_range > transaction.amount))) ? sender_scratch_card += rand(sender.scratch_card_min..sender.scratch_card_max) : sender_scratch_card += 0
      	puts total_transactions.size
      end

      receivers.reverse_each do |receiver|
         (receiver.period.to(-3) == "dai") ? v = "day".to_sym : v = receiver.period.to(-3).to_sym
         total_transactions = Transaction.where("created_at >= ?",1.public_send(v).ago).where(receiver_id: @receiver_id) + Transaction.where("created_at >= ?",1.public_send(v).ago).where(sender_id: @receiver_id)
         ((receiver.limit > total_transactions.size) and ((receiver.min_range < transaction.amount) and (receiver.max_range > transaction.amount))) ? receiver_scratch_card += rand(receiver.scratch_card_min..receiver.scratch_card_max) : receiver_scratch_card += 0   
      end	
     ScratchCard.create!(trans_id_id: @transaction_id, user_id: @sender_id, amount: sender_scratch_card)
     ScratchCard.create!(trans_id_id: @transaction_id, user_id: @receiver_id, amount:receiver_scratch_card)
     scratchcard_amount[0]=sender_scratch_card
     scratchcard_amount[1] = receiver_scratch_card
     scratchcard_amount
	end
end

