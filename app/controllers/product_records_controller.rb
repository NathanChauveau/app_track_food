class ProductRecordsController < ApplicationController
  before_action :authenticate_user!

  def index
    @product_records = current_user.product_records.includes(:product_record_products)
    @product_record = current_user.product_records.new
    @product_record.product_record_products.build
    @products = Product.all
    @user = current_user.email
  end

  def create
    @product_record = current_user.product_records.new(product_record_params)
    @product_record.user = current_user

    if @product_record.save
      redirect_to product_records_path, notice: "Product record was successfully created."
    else
      Rails.logger.debug @product_record.errors.full_messages.join(", ")
      @products = Product.all
      @product_records = current_user.product_records.includes(:product_record_products)
      @product_record.product_record_products.build if @product_record.product_record_products.empty?
      @user = current_user.email
      render :index, alert: "Erreur lors de la création du journal."
    end
  end

  def destroy
  end

  private
  def product_record_params
    params.require(:product_record).permit(:date, product_record_products_attributes: [ :product_id, :quantity, :_destroy ])
  end
end
