class FavoritesController < ApplicationController
  before_action :set_item
  def create
    favorite = current_user.favorites.build(item_id: params[:item_id])
    favorite.save
    redirect_to item_path(@item)
  end

  def destroy
    favorite = Favorite.find_by(item_id: params[:item_id], user_id: current_user.id)
    favorite.destroy
    redirect_to item_path(@item)
  end

  private

  def set_item
    @item = Item.includes(:user).find(params[:item_id])
  end
end
