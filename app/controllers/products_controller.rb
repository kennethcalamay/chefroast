class ProductsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  inherit_resources

  caches_action :index, layout: false

  def index
    @products = Product.all
  end

  def show
    show! and return if signed_in?
    @product = Product.published.find params[:id]
  end

  def create
    expire_action action: :index

    create! and return unless params[:commit] == 'Publish'
    @product = Product.new(params[:product])
    @product.publish!
    flash[:notice] = "Your product has been published!" unless @product.errors.any?
    respond_with @product
  end

  def update
    expire_action action: :index

    update! and return unless params[:commit] == 'Publish'

    @product = Product.find(params[:id])
    @product.update_attributes(params[:product])
    @product.publish!
    unless @product.errors.any?
      flash[:notice] = "Your product has been published!"
    end
    respond_with @product
  end

  def destroy
    expire_action action: :index

    destroy!
  end

  def drafts
    @products = Product.drafts
  end
end
