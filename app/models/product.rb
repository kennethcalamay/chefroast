class Product < ActiveRecord::Base
  attr_accessible :description, :image, :name, :price, :image_cache

  mount_uploader :image, ProductImageUploader

  scope :drafts, where(published: false)
  scope :published, where(published: true)

  def publish!
    self.published = true
    save!
  end
end
