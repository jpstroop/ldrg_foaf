class Interest < ActiveRecord::Base
	has_and_belongs_to_many :foafs
	accepts_nested_attributes_for :foafs
end
