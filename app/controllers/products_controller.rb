class ProductsController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  inherit_resources

  def index
    @products = Product.published
  end

  def show
    redirect_to root_url
  end
  
  def create
    create! and return unless params[:commit] == 'Publish'
    @product.publish!
    respond_with @product, notice: "Your product has been published!"
  end

  def update
    update! and return unless params[:commit] == 'Publish'
    @product = Product.find(params[:id])
    @product.update_attributes(params[:product])
    @product.publish!
    respond_with @product, notice: "Your product has been published!"
  end

  def drafts
    @products = Product.drafts
  end
end
