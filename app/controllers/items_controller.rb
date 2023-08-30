class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_q, only: [:index, :show, :search]

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
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
    @favorite_count = Favorite.where(item: @item).count
  end

  def edit
    redirect_to root_path unless current_user.id == @item.user.id && !@item.sold?
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy if user_signed_in? && current_user.id == @item.user.id
    redirect_to root_path
  end

  def search
    @items = @q.result.order('created_at DESC')
    render :search
    # respond_to do |format|
    #  format.html { render :index } # 通常の HTML レスポンス
    #  format.js
    #  format.json { render json: { html: render_to_string(partial: 'items_list', locals: { items: @items }) } }
    # end
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

  def set_q
    if params[:q]&.dig(:item_name)
      squished_keywords = params[:q][:item_name].squish
      params[:q][:item_name_cont_any] = squished_keywords.split(' ')
    end
    @q = Item.ransack(params[:q])
  end
end
