class Cart < ActiveRecord::Base
  before_save :check_is_current_for_sibling_carts
  
  belongs_to :customer
  has_many :line_items
  has_many :products, :through => :line_items
  
  # def title was created automatically because you didn't specify a string field
  # when you ran the refinery_engine generator. Love, Refinery CMS.
  def title
    "Override def title in vendor/engines/carts/app/models/cart.rb"
  end
  
  def grand_total
    total = 0
    line_items.each do |li|
      total += li.total_price
    end
    total
  end
  
  
  def add_to_the_cart(product_id, quantity = 1, variant_id = nil)
    if variant_id.blank?
      li = self.line_items.where(:product_id => product_id).first
    else
      li = self.line_items.where(:product_id => product_id, :variant_id => variant_id).first
    end  
    
    #logger.info("****************** the variant id = #{variant_id}")
    
    if li.present?
      li.quantity += quantity.to_i
      li.save
    else
      if variant_id.blank?  
        self.line_items.create(:product_id => product_id, :quantity => quantity)
      else
        self.line_items.create(:product_id => product_id, :quantity => quantity, :variant_id => variant_id)
      end
      
    end 
  end
  
  def check_is_current_for_sibling_carts
    if is_current.present? and is_current == true and customer_id.present?
      other_carts = Cart.where(:customer_id => self.customer_id)
      other_carts.each do |cart|
        cart.update_attributes(:is_current => false) if cart.id != self.id
      end
    end
  end
  
end
