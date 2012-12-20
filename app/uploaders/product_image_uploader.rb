# encoding: utf-8

class ProductImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process tags: ['chefroast', 'product', 'chefroast product']

  version :thumbnail do
    resize_to_fill(290, 193, :center)
  end

  def public_id
    return model.id
  end
end
