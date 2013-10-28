class Article < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	validates :description, presence: true
	validates :price, presence: true
	validates :total_in_shelf, presence: true
	validates :total_in_vault, presence: true
	validates :store_id, presence: true
	belongs_to :store

	def self.all_articles
		find_by_sql("select a.id, a.description, a.name, a.price, 
		a.total_in_shelf, a.total_in_vault, s.name as 'store_name' 
		from articles a, stores s where a.store_id = s.id")
	end

	def self.articles_by_store(store_id)
		find_by_sql("
      select a.id, a.description, a.name, a.price, a.total_in_shelf, a.total_in_vault, s.name as 'store_name'
      from articles a, stores s
      where a.store_id = s.id and s.id = #{store_id}")
	end

end
