class ProductsController < ApplicationController
  include SessionsHelper
  before_action :only_loggedin_users, only: [ :new, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "Product Added Successfully!"
      redirect_to products_url
    else
      flash[:warning] = @product.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Product was successfully updated."
      redirect_to products_url
    else
      flash[:notice] = @product.errors.full_messages.to_sentence
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    Product.find(params[:id]).destroy
    flash[:warning] = "Product deleted!"
    redirect_back(fallback_location: root_path)
  end

  private
  def product_params
    params.require(:product).permit(:product_name,:product_description,:price,:quantity)
  end
end
