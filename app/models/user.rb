class User < ActiveRecord::Base
  require 'digest/sha1'
  attr_accessor :password
  validates :password, :confirmation => true
  validates_length_of :password, :in => 5..10, :on => :create
  attr_accessible :name, :email, :password, :password_confirmation

  before_save :encrypt_password
  after_save :clear_password

	def encrypt_password
		if password.present?
			self.salt = Digest::SHA1.hexdigest("we add #{email} and #{Time.now}")
			encrypted_password = Digest::SHA1.hexdigest("Adding #{salt} to #{password}")
		end
	end
	def clear_password
		self.password = nil
		self.password_confirmation = nil
	end
end
