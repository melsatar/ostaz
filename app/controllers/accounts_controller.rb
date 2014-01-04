class AccountsController < ApplicationController

  before_action :set_account, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_action :role_required,  except: [:index]

  #before_action :set_page,       only: [:edit, :update, :destroy]
  #before_action :owner_required, only: [:edit, :update, :destroy]

  def index 
    @accounts = Account.all
    @sort = nil
    if params.has_key?(:sort)
      @sort = params[:sort]
      if @sort == 'name'
	@accounts = Account.order("a_name")
      elsif @sort == 'type'
        @accounts = Account.order("a_type")
      elsif @sort == 'amount'
        @accounts = Account.order("a_amount")
      else
        @accounts = Account.all
      end
    end
    if params.has_key?(:search)
	@accounts = Account.search(params[:search])
    end


  end

  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render action: 'show', status: :created, location: @account }
      else
        format.html { render action: 'new' }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:a_name, :a_type, :a_amount)
    end
end
