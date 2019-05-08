class Resume < ApplicationRecord
  validates :name, presence: true,
                    length: { minimum: 2 }
  has_one_attached :image
  scope :with_eager_loaded_image, -> { eager_load(image_attachment: :blob) }
  scope :with_preloaded_image, -> { preload(image_attachment: :blob) }

  def thumbnail
    self.image.variant(resize: '300x300!')
  end

  def banner
    self.image.variant(resize: '500x500!')
  end
end
