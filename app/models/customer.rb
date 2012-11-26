class Customer < ActiveRecord::Base
  
  before_save :formate_phone
  validates :firstName, :presence => true
  validates :lastName, :presence => true
  validates :phone, :presence => true
  validates :email, :presence => true
  validates_format_of :phone, :with => /^(\+?\{11}|\+?\d{3}?[-.]?\d{4}[-.]?\d{4})$/, :message => "should be 11 digits"
  validates_format_of :email, :with => /^[\w]([^@\s,:]+)@(([\w_]+\.)(com|edu|org|net|gov|mil|biz|info))$/i, :message => "is not a valid email adress"


  has_many :customer_cupcakes
  
  scope :alphabetical, order('firstName')
  def proper_name
	firstName + " " + lastName
	end




  private

  def formate_phone
  	phone = self.phone.to_s
  	#to avoid having nil phone field
  	phone.gsub!(/[^0-9]/, "")
  	#\ refers to regular expression
  	self.phone = phone
  end
  
end

#u = Customer.new(:firstName => "Safwen", :lastName => "Amor", :phone => #"97444667532", :email => "sf@aliya.com", :address => "PO Box 12345")
#u.save
