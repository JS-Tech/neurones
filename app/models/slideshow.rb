class Slideshow < ActiveRecord::Base
  attr_accessible :image, :link, :name, :date_exp

  mount_uploader :image, SlideshowUploader

  validates :image, presence: true
  validates :link, presence: true
  validates :name, presence: true, length: { maximum: 55 }
end
