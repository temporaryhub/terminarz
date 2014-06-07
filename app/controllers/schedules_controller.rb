class SchedulesController < ApplicationController
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
		if s.descirption.length > 50
			s.descirption = s.descirption[0..50]+' (...)'
        end
        sched.push({'start' => s.start_date, 'end' => s.end_date, 'title' => s.descirption, 'url' => 'schedules/'+s.id_schedule.to_s})
    end
	render json: sched
  end

  def new
	@schedule = Schedule.new
  end

  def create
	@schedule = Schedule.new(schedule_params)

	if @schedule.save
		redirect_to @schedule
	else
		render 'new'
	end
  end

  def show
    if (current_user.specialization_id == nil)
        query = 'id_schedule = ? AND patient_id = ?'
    else
        query = 'id_schedule = ? AND doctor_id = ?'
    end
    @schedule = Schedule.where(query,params[:id],current_user.id_user).first
  end

  def edit
    if (current_user.specialization_id == nil)
        query = 'id_schedule = ? AND patient_id = ?'
    else
        query = 'id_schedule = ? AND doctor_id = ?'
    end
    @schedule = Schedule.where(query,params[:id],current_user.id_user).first
  end

  def update
    if (current_user.specialization_id == nil)
        query = 'id_schedule = ? AND patient_id = ?'
    else
        query = 'id_schedule = ? AND doctor_id = ?'
    end
    @schedule = Schedule.where(query,params[:id],current_user.id_user).first

	if @schedule.update(schedule_params)
	redirect_to @schedule
	else
	render 'edit'
	end
  end

  def destroy
    if (current_user.specialization_id == nil)
        query = 'id_schedule = ? AND patient_id = ?'
    else
        query = 'id_schedule = ? AND doctor_id = ?'
    end
    @schedule = Schedule.where(query,params[:id],current_user.id_user).first
	@schedule.destroy
	redirect_to action: 'index', controller: 'welcome'
  end

  private
  def schedule_params
	params.require(:schedule).permit(:doctor_id, :patient_id, :start_date, :end_date, :descirption)
  end
end
