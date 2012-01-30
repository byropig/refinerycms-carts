class FieldsAddedToLineItems < ActiveRecord::Migration
  def self.up
		add_column :line_items, :variant_id, :integer
  end

  def self.down
		remove_column :line_items, :variant_id
  end
end
