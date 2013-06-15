class Product < ActiveRecord::Base
  attr_accessible :description, :image, :name, :price, :image_cache, :published

  validates :name, presence: true
  validates :image, :description, :price,  presence: true, if: :published?
  validates :price, numericality: { greater_than_or_equal_to: 0 }, if: :published?

  mount_uploader :image, ProductImageUploader

  scope :drafts, where(published: false)
  scope :published, where(published: true)

  after_save :expire_product_all_cache
  after_destroy :expire_product_all_cache

  def self.all_cached
    Rails.cache.fetch('Product.all'){ published.all }
  end

  def publish!
    self.published = true
    save
  end

  private

    def expire_product_all_cache
      Rails.cache.delete('Product.all')
    end

end
