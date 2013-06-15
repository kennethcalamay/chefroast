class Product < ActiveRecord::Base
  attr_accessible :description, :image, :name, :price, :image_cache, :published

  validates :name, presence: true
  validates :image, :description, :price,  presence: true, if: :published?
  validates :price, numericality: { greater_than_or_equal_to: 0 }, if: :published?

  mount_uploader :image, ProductImageUploader

  scope :drafts, where(published: false)
  scope :published, where(published: true)

  def publish!
    self.published = true
    save
  end

end
