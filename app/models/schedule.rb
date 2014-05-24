class Schedule < ActiveRecord::Base
    self.table_name = "Schedules"
    self.primary_key = "id_schedule"
	belongs_to :doctor, :class_name => "User", :foreign_key => "doctor_id"
	belongs_to :patient, :class_name => "User", :foreign_key => "patient_id"
end
