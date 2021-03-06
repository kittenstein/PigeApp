class ContestsController < ApplicationController
	attr_accessor :idshow
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
		$idshow = params[:id]
		@contest = Contest.find(params[:id])
		@pigeons = @contest.pigeons
	end
	
	def create_pigeon
		@contest = Contest.find($idshow)
		@pigeon = @contest.pigeons.build(pigeon_params)
  	if @pigeon.save
			flash[:success] = "Pigeon created!"
    	redirect_to "/show_contests/" + @contest.id.to_s
		else
    	render 'static_pages/home'
  	end
	end
	
	private

    def contest_params
      params.require(:contest).permit(:name, :lat, :long)
    end
    
    def pigeon_params
    	params.require(:pigeon).permit(:code, :latitude, :longitude)
    end
    
end
