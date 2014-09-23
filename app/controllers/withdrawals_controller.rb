class WithdrawalsController < ApplicationController
before_filter :signed_in
before_filter :admin_user, only: :index

  def create
#  	@item = Item.find(params[:withdrawal][:item_id])
#    edition = params[:withdrawal][:edition]
#  	current_user.withdraw!(@item, edition)
#    flash[:success] = "Withdrawn #{@item.pretty_name} from the Library. It's due back at A TIME IN THE FUTURE."
#  	redirect_to @item
    params[:withdrawals].each do |i, wd|
      user = User.find(wd[:user_id][0])
      user.withdraw!(wd[:item_id][0], wd[:edition][0])
    end
    redirect_to withdrawals_path
  end

  def destroy
    @withdrawal = Withdrawal.find(params[:id])
    @item = @withdrawal.item
    current_user.unwithdraw!(@item, @withdrawal.edition)
    flash[:success] = "Returned #{@item.pretty_name} to the Library!"
    redirect_to @item
  end

  def new
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
