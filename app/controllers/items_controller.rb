class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :item_name,
      :description,
      :category_id,
      :status_id,
      :delivery_charge_id,
      :ship_from_id,
      :days_to_ship_id,
      :price
    ).merge(
      user_id: current_user.id
    )
  end
end
