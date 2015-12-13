class ContestsController < ApplicationController

	def show
		@user = User.all
		@contests = []
		@user.each do |user|
			@contests += user.contests
		end
	end
	
	def create
  	@contest = current_user.events.build(event_params)
  	if @contest.save
			flash[:success] = "Contest created!"
    	redirect_to show_contests_path
		else
    	render 'static_pages/home'
  	end
	end
	
	private

    def event_params
      params.require(:contest).permit(:name, :lat, :long)
    end
    
end
