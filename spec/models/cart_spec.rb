require 'spec_helper'

describe Cart do

  def reset_cart(options = {})
    @valid_attributes = {
      :id => 1
    }

    @cart.destroy! if @cart
    @cart = Cart.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_cart
  end

  context "validations" do
    
  end

end