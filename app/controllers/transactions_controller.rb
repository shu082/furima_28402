class TransactionsController < ApplicationController
  before_action :move_to_login, expect: [:index]
  before_action :move_to_top, expect: [:index]
  before_action :move_to_top_page, expect: [:index]
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @transaction = TransactionAddress.new(transaction_params)
    if @transaction.valid?
      pay_item
      @transaction.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def transaction_params
    params.permit(:post_number, :prefecture_id, :city, :block, :building_number, :tel, :token, :price, :item_id).merge(user_id: current_user.id)
  end

  def move_to_login
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def move_to_top
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def move_to_top_page
    @item = Item.find(params[:item_id])
    if @item.items_management
      redirect_to root_path
    end
  end


  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: transaction_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
end
