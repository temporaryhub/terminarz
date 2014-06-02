class User < ActiveRecord::Base
    self.table_name = "Users"
    self.primary_key = "id_user"
	has_many :schedules, :class_name => 'Schedule'
	belongs_to :specialization, :class_name => 'Specialization'
end
