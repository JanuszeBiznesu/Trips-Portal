class Book < ActiveRecord::Base
	  	include Tire::Model::Search
	  	include Tire::Model::Callbacks
		mount_uploader :picture, PictureUploader
		has_many :copy, dependent: :destroy
		belongs_to :genre
		validates :title,  presence: true, length: { maximum: 50 }
		validates :author,  presence: true, length: { maximum: 50 }
		validates :synopsis, presence:true
		validates :genre_id, presence:true

		index_name "books-#{Rails.env}"

		def clear_book_index
			Book.tire.index.delete
			Book.tire.index.create(:mappings => Book.tire.mapping_to_hash, :settings => Book.tire.settings)
			Book.tire.index.refresh
		end

		mapping do 
			indexes :id, index: :not_analyzed, type: 'integer'
			indexes :title, boost:100
			indexes :synopsis
			indexes :author
		end

		def to_indexed_json
			{
				id: id,
				title: title,
				synopsis: synopsis,
				author: author
			}.to_json
		end

end
