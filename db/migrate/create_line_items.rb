class CreateLineItems < ActiveRecord::Migration

  def self.up
    create_table :line_items do |t|
      t.references :cart
      t.references :product
      t.integer :quantity
      t.integer :position

      t.timestamps
    end

    add_index :line_items, :id

    load(Rails.root.join('db', 'seeds', 'line_items.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "line_items"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/line_items"})
    end

    drop_table :line_items
  end

end
