class CreateCarts < ActiveRecord::Migration

  def self.up
    create_table :carts do |t|
      t.references :customer
      t.boolean :is_current
      t.integer :position

      t.timestamps
    end

    add_index :carts, :id

    load(Rails.root.join('db', 'seeds', 'carts.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "carts"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/carts"})
    end

    drop_table :carts
  end

end
