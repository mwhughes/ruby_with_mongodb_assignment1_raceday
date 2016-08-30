class Racer < ActiveRecord::Base
		include ActiveModel::Model
		attr_accessor :id, :number, :first_name, :last_name, :gender, :group, :secs
	def self.mongo_client
		Mongoid::Clients.default
	end

	def self.collection
		self.mongo_client['racers']
	end

	def self.all(prototype={}, sort = {:number=>1}, skip=0, limit=nil)
			result = collection.find(prototype)
			.sort(sort)
			.skip(skip)
		result = result.limit(limit) if !limit.nil?
		return result
	end
end