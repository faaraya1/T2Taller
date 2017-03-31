class User < ApplicationRecord
	validates :nombre, presence: true
	validates :apellido, presence: true
end
