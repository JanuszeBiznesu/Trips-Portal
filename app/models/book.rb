require 'elasticsearch/model'

class Book < ActiveRecord::Base
	  include Elasticsearch::Model
	  include Elasticsearch::Model::Callbacks
	  mount_uploader :picture, PictureUploader
	  has_many :copy, dependent: :destroy
	  validates :title,  presence: true, length: { maximum: 50 }
	  validates :author,  presence: true, length: { maximum: 50 }
	  validates :synopsis, presence:true
end
