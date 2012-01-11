module Admin
  class CartsController < Admin::BaseController

    crudify :cart, :xhr_paging => true

  end
end
