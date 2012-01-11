class CartsController < ApplicationController

  def add_to_cart
      check_quantity_then_update_cart  
      
      # logger.info("****************** current page = #{@page}")
      
      
      redirect_to_products("Product added to Cart")
        
  end
  
  def show_cart
    
  end
  
  def check_quantity_then_update_cart
    if params[:quantity].present?
      @current_cart.add_to_the_cart(params[:product_id], params[:quantity])
    else
      @current_cart.add_to_the_cart(params[:product_id])
    end
  end
    
  def increment_cart
    check_quantity_then_update_cart
    
    redirect_to show_cart_path
  end
    
  private
  
  def redirect_to_products(msg)
      flash[:notice] = msg
      
      if params[:category_id].present?
        if params[:category_id] == "0"
          redirect_to "/"
        else
          redirect_to category_products_path(params[:category_id])
        end    
      else
        redirect_to product_path(params[:product_id])
      end          
  end

end
