class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    redirect_to root_path if current_user.id == @item.user.id || @item.sold?
    @order_sending_address = OrderSendingAddress.new
  end

  def create
    @order_sending_address = OrderSendingAddress.new(order_sending_address_params)
    if @order_sending_address.valid?
      pay_item
      redirect_to root_path if @order_sending_address.save
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_sending_address_params
    params.require(:order_sending_address).permit(
      :postal,
      :ship_from_id,
      :municipalities,
      :address,
      :tel,
      :building
    ).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: @order_sending_address.token,
      currency: 'jpy'
    )
  end
end
