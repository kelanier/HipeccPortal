class User < ActiveRecord::Base
  attr_accessor :password
  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  validates :first_name, :presence => true,
  validates :last_name, :presence => true,
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 6..20, :on => :create
  validates :organization, :presence => true,
  validates :address_street, :presence => true,
  validates :address_city, :presence => true,
  validates :address_state, :presence => true,
  validates :address_country, :presence => true,
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
end
