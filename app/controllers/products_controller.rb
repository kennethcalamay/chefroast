class ProductsController < ApplicationController
  inherit_resources

  actions :all, except: [:show]
end
