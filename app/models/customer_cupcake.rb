class CustomerCupcake < ActiveRecord::Base
  attr_accessor :firstName, :lastName, :falvor, :customer_id
  belongs_to :customer
  validates :name, :presence => true
  
  validates_inclusion_of :flavor, :in => %[RedVelvet, Chocolate, Vanilla, Strawberry, Pistachio], :message => "is not an option", :allow_nil => true, :allow_blank => true
   FLAVORS = [ ['Red Velvet', 'RedVelvet'], ['Chocolate', 'Chocolate'], ['Vanilla', 'Vanilla'], ['Strawberry', 'Strawberry'], ['Pistachio', 'Pistachio'] ]

  validates_inclusion_of :icing, :in => %[creamcheese, Chocolate, Vanilla, Strawberry, Pistachio], :message => "is not an option", :allow_nil => true, :allow_blank => true
   ICINGS = [ ['Cream Cheese', 'creamcheese'], ['Chocolate', 'Chocolate'], ['Vanilla', 'Vanilla'], ['Strawberry', 'Strawberry'], ['Pistachio', 'Pistachio'] ]

   validates_inclusion_of :size, :in => %[Mini, Normal, Large], :message => "is not an option", :allow_nil => true, :allow_blank => true
   SIZES = [ ['Mini', 'Mini'], ['Normal', 'Normal'], ['Large', 'Large'] ]

   scope :alphabetical, order('name')
   scope :for_user, lambda{|customer_id| where('id = ?', customer_id)}
   # scope :latest, lambda{|num| limit(num).order('visit_date DESC')} 
  
end
