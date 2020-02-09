class ProductController < ApplicationController
  before_action :authenticate_user

  def index
    @products = Product.all

    render json: {product: @products, current_user: current_user}, status: :ok
  end

  def create
    @product = Product.new(product_params)
    # @product.jumlah = 1
    if @product.save
      render json: ['Data Created', @product], status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.where(id: params[:id]).first
    @product.update(product_params)
    if @product.save
      render json: ['Data Updated', @product], status: :ok
    else
      render json: @product.errors, status: :bad_request
    end
  end

  def show
    @product = Product.where(id: params[:id]).first
    # @product = Product.find(params[:id])
    if @product
      render json: @product, status: :ok
    else
      render json: ['No ID match in database'], status: :not_found
    end

  end

  def destroy
    @product = Product.where(id: params[:id]).first
    if @product.destroy
      render status: :ok
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  private

  def product_params
    params.require(:product).permit(:nama, :jumlah)
  end
end
