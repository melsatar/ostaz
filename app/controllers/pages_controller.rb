class PagesController < ActionController::Base
  before_filter :authenticate_user!
  #before_filter :role_required

  def search
    @accounts = Account.all
    @amount = params[:amount]
    @f_account = params[:f_account]
    @t_account = params[:t_account]
    @t_date = params[:t_date]
    @transactions = Transaction.search(@amount,@f_account, @t_account, @t_date)
    
      
  end

 def assign
   @roles = Role.all
   @users = User.all
   @assigned_user = params[:user]
   @assigned_role = params[:role]
   if @assigned_user != "" and @assigned_role != "" and @assigned_user and @assigned_role 
       user = User.find_by_id(@assigned_user)
       user.update( role: Role.find_by_id(@assigned_role))
       flash.now[:notice] = 'The user has been authorized!'
   else
	flash.now[:notice] = 'Error occured, make sure that you select the user and role'
   end


 
 end


end
