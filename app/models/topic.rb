class Topic < ApplicationRecord
 validates_presence_of :title, :image
 
 mount_uploader :image, TopicUploader
 
 has_many :blogs
 has_many :categories
 
 def self.with_blogs
  includes(:blogs).where.not(blogs: { id: nil})
 end
 
 def self.with_categories
  includes(:categories).where.not(categories: { id: nil})
 end
end
