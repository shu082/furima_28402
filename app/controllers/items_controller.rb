class ItemsController < ApplicationController
  def index
    @items = Item.includes(:items_management).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def created
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image,:name,:description,:category,:status,:delivery_charge,:delivery_source,:delivery_days,:price,:user)
  end
end
