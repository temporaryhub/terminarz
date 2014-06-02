class WelcomeController < ApplicationController
  def index
	@schedules = Schedule.all
  end
end
