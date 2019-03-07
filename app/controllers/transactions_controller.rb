class TransactionsController < ApplicationController

def index
scratch_cards = TransactionService.new(params).perform	
render json: {sender: "You have Received Scratch card amount Rs #{scratch_cards[0]}", receiver: "You have Received Scratch card amount Rs #{scratch_cards[1]}" }
end
def create
TransactionService.new(params).perform	
render json: {message: "Transation Created"}
end
def show
	render json: transaction
end

private

def transaction_params
	params.require(:transaction).permit(:id,:sender_id, :receiver_id, :amount)

	end

end