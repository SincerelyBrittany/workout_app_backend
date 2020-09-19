class WorkoutsController < ApplicationController
    before_action :authenticate_user!
    def index
        workouts = current_user.workouts
        render json: workouts.to_json(include: [:user_workouts])
    end

    def show
        workout = Workout.find(params[:id])
        authorize_user_resource(workout)
        render_resource(workout, with: [:user_workouts])
    end 

    def create
        workout = Workout.new(workout_params)
        workout.user = current_user
        workout.save
        render_resource(workout)
    end 

    def update 
        workout = Workout.find(params[:id])
        authorize_user_resource(workout)
        workout.update(workout_params)
        render_resource(workout)
    end 

    def destroy
        workout = Workout.find(params[:id])
        authorize_user_resource(workout)
        workout.destroy
        render_resource(workout)
    end 

    private

    def workout_params
        params.require(:workout).permit(:name, :url, :time, :category)
    end 
end
