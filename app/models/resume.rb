# frozen_string_literal: true

class Resume < ApplicationRecord
  validates :name, presence: true,
                   length: { minimum: 2 }
  has_one_attached :image

  def thumbnail
    image.variant(resize: '300x300!')
  end

  def banner
    image.variant(resize: '500x500!')
  end
end
