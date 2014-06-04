class SchedulesController < ApplicationController
  layout "json"
  def get
    s = DateTime.strptime(params[:start],'%s')
    e = DateTime.strptime(params[:end],'%s')
    sched = Array.new
    if (current_user.specialization_id == nil)
        query = 'start_date >= ? AND start_date <= ? AND patient_id = ?'
    else
        query = 'start_date >= ? AND start_date <= ? AND doctor_id = ?'
    end
    Schedule.where(query,s,e,current_user.id_user).all.each do |s|
        sched.push({'start' => s.start_date, 'end' => s.end_date, 'title' => s.descirption})
    end
	render json: sched
  end
end
