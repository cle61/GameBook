class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

	has_one :profile
	has_many :book

	def to_param
		username
	end

	after_create :create_default_profile

	def create_default_profile
		p = self.build_profile
		p.save(validate: false)
	end
end