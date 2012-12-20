class ProductsController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  inherit_resources

  actions :all, except: [:show]
end
