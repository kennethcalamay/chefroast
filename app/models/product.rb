class Product < ActiveRecord::Base
  attr_accessible :description, :image, :name, :price, :image_cache

  mount_uploader :image, ProductImageUploader
end
