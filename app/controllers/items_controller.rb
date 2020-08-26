class ItemsController < ApplicationController
  def index
    @items = Item.includes(:items_management).order("created_at DESC")
  end

  def new

  end
end
