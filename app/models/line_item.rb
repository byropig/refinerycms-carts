class LineItem < ActiveRecord::Base

  belongs_to :cart
  belongs_to :product
  belongs_to :variant
  
  # def title was created automatically because you didn't specify a string field
  # when you ran the refinery_engine generator. Love, Refinery CMS.
  def title
    "Override def title in vendor/engines/line_items/app/models/line_item.rb"
  end
  
  def total_price
    if variant_id.blank?  
      product.price * quantity
    else
      variant.price * quantity
    end  
      
  end
  
  def grand_total
    total = 0
    line_items.each do |li|
      total += li.total_price
    end
    total
  end
  
end
