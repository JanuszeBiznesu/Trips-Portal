require 'elasticsearch/model'

class Book < ActiveRecord::Base
		include Elasticsearch::Model
		include Elasticsearch::Model::Callbacks
		mount_uploader :picture, PictureUploader
		has_many :copy, dependent: :destroy
		belongs_to :genre
		validates :title,  presence: true, length: { maximum: 50 }
		validates :author,  presence: true, length: { maximum: 50 }
		validates :synopsis, presence:true
		validates :genre_id, presence:true


	  	def self.search(query)
	  		if query[:genre_id] == '0'
	  			__elasticsearch__.search(query_without_genre(query))
	  		else
	  			__elasticsearch__.search(query_with_genre(query))
	  		end
	  	end

	  	def self.query_with_genre(query)
			  		{
				  		query: 
				  		{
				  				filtered: 
				  				{
				  					query: 
				  					{
				  						multi_match: 
				  						{
				  							query: query[:q],
				  							fields: ['title^10', 'synopsis']
				  						}
				  					},

				  					filter: 
				  					{
				  						term:
				  						{
				  							genre_id: query[:genre_id]
				  						}
				  					}


				  				}

				  		}
			  		}
		end

		def self.query_without_genre(query)
			  		{
				  		query: 
				  		{
				  				filtered: 
				  				{
				  					query: 
				  					{
				  						multi_match: 
				  						{
				  							query: query[:q],
				  							fields: ['title^10', 'synopsis']
				  						}
				  					}
				  				}

				  		}
			  		}
		end

end
Book.import
