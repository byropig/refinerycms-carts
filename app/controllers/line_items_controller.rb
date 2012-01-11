class LineItemsController < ApplicationController

  def destroy
      LineItem.destroy(params[:id])
      redirect_to show_cart_path
  end

end
