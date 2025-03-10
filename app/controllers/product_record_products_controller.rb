class ProductRecordProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product_record

  def new
    @product_record_product = @product_record.product_record_products.new
  end

  def create
    @product_record_product = @product_record.product_record_products.new(product_record_product_params)
    if @product_record_product.save
      redirect_to product_records_path, notice: "Product was successfully added."
    else
      render :new
    end
  end

  private

  def set_product_record
    @product_record = current_user.product_records.find(params[:product_record_id])
  end

  def product_record_product_params
    params.require(:product_record_product).permit(:product_id, :quantity)
  end
end
