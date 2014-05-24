class Specialization < ActiveRecord::Base
    self.table_name = "Specializations"
    self.primary_key = "id_specialization"
	has_many :users, :class_name => 'User'
end
