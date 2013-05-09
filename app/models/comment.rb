class Comment < ActiveRecord::Base
  attr_accessible :content, :thumbdown, :thumbup, :title, :user_id, :article_id

  validates :title, presence: true, length: { maximum: 55 }
  validates :content, presence: true

  belongs_to :imageable, :polymorphic => true
end
