class StepsController < ApplicationController
	before_action :admin_user
	before_action :logged_in_user
	def new
		@step = Step.new
		@templates = Template.all
	end

	def show
		@step = Step.find(params[:id])
	end

	def index
		@steps = Step.all
	end

	def edit
		@step = Step.find(params[:id])
		@templates = Template.all
	end

	def destroy
		Step.find(params[:id]).destroy
		flash[:success] = "step deleted ."
		redirect_to steps_url		
	end

	def create
		@templates = Template.all
		@step = Step.new(step_params)
		if @step.save
			flash[:success] = "step created successfully."
			redirect_to @step
		else
			render 'new'
		end
	end

	def update
		@templates = Template.all
		@step = Step.find(params[:id])
		if @step.update_attributes(step_params)
			flash[:success] = "step updated successfully"
			redirect_to @step
		else
			render 'edit'
		end
	end

	private

	def step_params
		params.require(:step).permit(:template_id, :hour, :day)
	end
end
