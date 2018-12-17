class RootController < ApplicationController

  def index
    @items = Item.all
  end

end
