class WithdrawalsController < ApplicationController
before_action :signed_in
before_action :admin_user

  def destroy
    @withdrawal = Withdrawal.find(params[:id])
    @item = @withdrawal.item
    @withdrawal.destroy
    flash[:success] = "Returned #{@item.pretty_name} to the Library!"
    redirect_to withdrawals_path
  end

  def index
    @withdrawals = Withdrawal.all
  end

  private

    def signed_in
      unless signed_in?
        flash[:error] = "Please sign in."
        redirect_to signin_path
      end
    end

end
