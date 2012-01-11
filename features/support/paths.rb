module NavigationHelpers
  module Refinery
    module Carts
      def path_to(page_name)
        case page_name
        when /the list of carts/
          admin_carts_path

         when /the new cart form/
          new_admin_cart_path
        when /the list of line_items/
          admin_line_items_path

         when /the new line_item form/
          new_admin_line_item_path
        else
          nil
        end
      end
    end
  end
end
