class ProductRecordsController < ApplicationController
  before_action :authenticate_user!

  def index
    @product_records = current_user.product_records
  end

  def new
    @product_record = current_user.product_records.new
  end

  def create
    @product_record = current_user.product_records.new(product_record_params)
    if current_user.product_records.exists?(date: @product_record.date)
      redirect_to new_product_record_path, alert: "You already have a record for this date."
    elsif @product_record.save
      redirect_to product_records_path, notice: "Product record was successfully created."
    else
      render :new
    end
  end

  def destroy
  end

  def show
    @product_record = current_user.product_records.find(params[:id])
    @product_record_products = @product_record.product_record_products.includes(:product)
  end

  private

  def product_record_params
    params.require(:product_record).permit(:date, :weight)
  end

  def graph
    @weight_data = ProductRecord
      .where(user_id: current_user.id, date: 30.days.ago..Date.today)
      .order(:date)
      .pluck(:date, :weight)
      .map { |date, weight| [date.to_s, weight.to_f] } # 🔥 Convertit bien les dates et poids
      .to_h

    puts "DEBUG WEIGHT DATA: #{@weight_data.inspect}" # 🔍 Vérifie que les données sont récupérées
  end
end
