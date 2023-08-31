class UsersController < ApplicationController
  before_action :set_q, only: [:show]

  def show
    @user = User.find(params[:id])
    @items = @user.items
    @favorite_items = @user.favorite_items
  end

  private

  def set_q
    if params[:q]&.dig(:item_name)
      squished_keywords = params[:q][:item_name].squish
      params[:q][:item_name_cont_any] = squished_keywords.split(' ')
    end
    @q = Item.ransack(params[:q])
  end
end
