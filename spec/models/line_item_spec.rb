require 'spec_helper'

describe LineItem do

  def reset_line_item(options = {})
    @valid_attributes = {
      :id => 1
    }

    @line_item.destroy! if @line_item
    @line_item = LineItem.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_line_item
  end

  context "validations" do
    
  end

end