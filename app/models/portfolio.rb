class Portfolio < ApplicationRecord
  enum status: { draft: 0, published: 1}
  validates_presence_of :title, :description

  mount_uploader :thumbnail_image, ImageUploader
	mount_uploader :main_image, ImageUploader

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  def self.by_position
    order("position ASC")
  end
end
