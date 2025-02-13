class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.all

    if current_user
      @user = current_user.email
    else
      redirect_to new_user_session_path, notice: "You are not logged in."
    end
  end

  def show
    @product = Product.find(params[:id])
    @categories = Category.all
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def create
    @product = Product.new(product_params)
    @user = current_user.email
    if @product.save
      redirect_to products_path, notice: "Product was successfully created."
    else
      @categories = Category.all
      render :new, status: :unprocessable_entity
    end
  end

  def update
  end

  def store
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path, notice: "Product was successfully deleted."
  end

  private

  def product_params
    params.require(:product).permit(:name, :kcals, :category_id, :image)
  end
end
