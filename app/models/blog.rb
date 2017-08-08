class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  validates_presence_of :title, :body
  
  belongs_to :topic
  
  has_many :comments, dependent: :destroy
  
  def self.special_blogs
    all
  end
  
  def self.featured_blogs
    limit(2)
  end
  
  def self.recent
    all.order(created_at: :desc)
  end
  
  def self.status
    if user.has_roles?(:site_admin)
      all.order(created_at: :desc)
    else
      all.published(created_at: :desc)
    end
  end
  
end
