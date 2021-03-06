class EventsController < ApplicationController

	def show
		@user = User.all
		@events = []
		@user.each do |user|
			@events += user.events
		end
	end
	
	def create
  	@event = current_user.events.build(event_params)
  	if @event.save
			flash[:success] = "Event created!"
    	redirect_to show_events_path
		else
    	render 'static_pages/home'
  	end
	end
	
	private

    def event_params
      params.require(:event).permit(:header, :content)
    end
end
