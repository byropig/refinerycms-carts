module Admin
  class LineItemsController < Admin::BaseController

    crudify :line_item, :xhr_paging => true

  end
end
