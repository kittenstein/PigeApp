class ContestsController < ApplicationController

	def show
		@user = User.all
		@contests = []
		@user.each do |user|
			@contests += user.contests
		end
	end
	
	def create
  	@contest = current_user.contests.build(contest_params)
  	if @contest.save
			flash[:success] = "Contest created!"
    	redirect_to show_contests_path
		else
    	render 'static_pages/home'
  	end
	end
	
	def edit
		@contest = Contest.find(params[:id])
	end
	
	private

    def contest_params
      params.require(:contest).permit(:name, :lat, :long)
    end
    
end
