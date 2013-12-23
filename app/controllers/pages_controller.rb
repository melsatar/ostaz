class PagesController < ActionController::Base
  
  def search
    @accounts = Account.all
    @amount = params[:amount]
    @f_account = params[:f_account]
    @t_account = params[:t_account]
    @t_date = params[:t_date]
    #if @amount or @f_account or @t_account or @t_date
	@transactions = Transaction.search(@amount,@f_account, @t_account, @t_date)
    #else
     # @transactions = Transaction.all
    #end
      
  end
end
