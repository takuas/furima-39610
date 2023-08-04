class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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

  def show
  end

  def edit
    redirect_to root_path unless current_user.id == @item.id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
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
      :price,
      :image
    ).merge(
      user_id: current_user.id
    )
  end

  def set_item
    @item = Item.includes(:user).find(params[:id])
  end
end
