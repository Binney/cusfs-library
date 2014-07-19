class WithdrawalsController < ApplicationController
before_filter :signed_in

  def create
  	@item = Item.find(params[:withdrawal][:item_id])
    edition = params[:withdrawal][:edition]
  	current_user.withdraw!(@item, edition)
  	redirect_to @item
  end

  def destroy
    @withdrawal = Withdrawal.find(params[:id])
    @item = @withdrawal.item
    current_user.unwithdraw!(@item, @withdrawal.edition)
    redirect_to @item
  end

  private

    def signed_in
      unless signed_in?
        flash[:error] = "Please sign in."
        redirect_to signin_path
      end
    end

end
