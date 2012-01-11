class LineItem < ActiveRecord::Base

  belongs_to :cart
  belongs_to :product
  
  # def title was created automatically because you didn't specify a string field
  # when you ran the refinery_engine generator. Love, Refinery CMS.
  def title
    "Override def title in vendor/engines/line_items/app/models/line_item.rb"
  end
  
  def total_price
      
    product.price * quantity
      
  end
  
  def grand_total
    total = 0
    line_items.each do |li|
      total += li.total_price
    end
    total
  end
  
end
