class Schedule < ActiveRecord::Base
	validates :descirption, presence: true, length: { minimum: 5 }
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :doctor_id, presence: true
    validates :patient_id, presence: true
    self.table_name = "Schedules"
    self.primary_key = "id_schedule"
	belongs_to :doctor, :class_name => "User", :foreign_key => "doctor_id"
	belongs_to :patient, :class_name => "User", :foreign_key => "patient_id"
end
