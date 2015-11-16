class TemplatesController < ApplicationController
	before_action :admin_user

	def new		
		@template = Template.new
	end

	def show
		@template = Template.find(params[:id])
	end

	def index
		@templates = Template.all		
	end

	def edit
		@template = Template.find(params[:id])
	end

	def destroy
    Template.find(params[:id]).destroy  
    flash[:success] = "template deleted!"
    redirect_to templates_url
  end

	def create
		@template = current_user.templates.build(template_params)
		if @template.save
			flash[:success] = "Template created successfully. Now create Step."
			redirect_to new_step_path
		else
			render 'new'
		end
	end

	def update
    @template = Template.find(params[:id])
    if @template.update_attributes(template_params)
      flash[:success] = "a template updated!"
      redirect_to @template
    else
      render 'edit'
    end
  end

	private
	
	def template_params	
		params.require(:template).permit(:user_id, :subject, :body)
	end
end
