class Article < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	validates :description, presence: true
	validates :price, presence: true
	validates :total_in_shelf, presence: true
	validates :total_in_vault, presence: true
	validates :store_id, presence: true
	belongs_to :store
end
