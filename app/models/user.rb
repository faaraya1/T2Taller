class User < ApplicationRecord
	validates :nombre, presence: true
	validates :apellido, presence: true

	def to_json(options={})
     options[:except] ||= [:created_at, :updated_at]
     super(options)
   end
end
