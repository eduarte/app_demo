class Store < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	validates :address, presence: true
	has_many :articles , inverse_of: :store
end
