class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)
   
    if transaction_params[:t_amount].to_f > 0
	   account_from = Account.find_by_id(transaction_params[:from_account_id])
   	   account_from.a_amount = account_from.a_amount - transaction_params[:t_amount].to_f
	   if account_from.a_amount >= 0
        	account_from.save
        	account_to = Account.find_by_id(transaction_params[:to_account_id])
        	account_to.a_amount = account_to.a_amount + transaction_params[:t_amount].to_f
        	account_to.save
   	   end
   end
      respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render action: 'show', status: :created, location: @transaction }
     else
	format.html { render action: 'new' }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
     end
     end
   
 end

    
  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update


 if transaction_params[:t_amount].to_f > 0
	   current_transaction = Transaction.find_by_id(transaction_params[:id])
	   account_from = Account.find_by_id(transaction_params[:from_account_id])
   	   account_from.a_amount = account_from.a_amount + @transaction.t_amount - transaction_params[:t_amount].to_f
	   if account_from.a_amount >= 0
        	account_from.save
        	account_to = Account.find_by_id(transaction_params[:to_account_id])
        	account_to.a_amount = account_to.a_amount - @transaction.t_amount + transaction_params[:t_amount].to_f
        	account_to.save
   	   end
   end
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:from_account_id, :to_account_id, :t_amount, :t_date, :t_desc)
    end
end
