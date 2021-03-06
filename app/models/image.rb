class Image < ActiveRecord::Base
  attr_accessible :image, :name

  has_many :articles

  mount_uploader :image, ImageUploader

  validates :image, presence: true

  before_create :default_name

  def default_name
  	self.name ||= File.basename(image.filename, '.*') if image
  end
  
end
