class Admins::OrderedProductsController < ApplicationController
  def update
    @ordered_product = OrderedProduct.find(params[:id])
    @ordered_product.ordered_product_update_check(ordered_product_params)
    redirect_back fallback_location: admins_root_path
  end

  private
  def ordered_product_params
    params.require(:ordered_product).permit(:status)    
  end
end
