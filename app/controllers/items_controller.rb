class ItemsController < ApplicationController

  def index
    @items = Item.includes(:items_management).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image,:name,:description,:category_id,:status_id,:delivery_charge_id,:delivery_source_id,:delivery_days_id,:price,).merge(user_id: current_user.id)
  end
end
