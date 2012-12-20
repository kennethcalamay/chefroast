class ProductsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  inherit_resources

  def index
    @products = Product.published
  end

  def show
    show! and return if signed_in?
    @product = Product.published.find params[:id]
  end

  def create
    create! and return unless params[:commit] == 'Publish'
    @product = Product.new(params[:product])
    @product.publish!
    flash[:notice] = "Your product has been published!"
    respond_with @product
  end

  def update
    update! and return unless params[:commit] == 'Publish'
    @product = Product.find(params[:id])
    @product.update_attributes(params[:product])
    @product.publish!
    flash[:notice] = "Your product has been published!"
    respond_with @product
  end

  def drafts
    @products = Product.drafts
  end
end
