class ResumesController < ApplicationController
  # skip_before_filter :verify_authenticity_token
      
  def index
    resumes = Resume.order('created_at DESC')
    render json: {status: 'SUCCESS', message: 'Loaded resumes', data: resumes}, status: :ok
  end

  def show
    resume = Resume.find(params[:id])
    render json: {status: 'SUCCESS', message: 'Loaded resumes', data: resume}, status: :ok
  end

  def new
    @resume = Resume.new
  end

  def edit
    @resume = Resume.find(params[:id])
  end

  # POST request
  def create
    resume = Resume.new(resume_params)
    if resume.save
      render json: {status: 'SUCCESS', message: 'Saved resume', data: resume}, status: :ok
    else
      render json: {status: 'ERROR', message: 'Failed to save', data: resume.errors}, status: :unprocessable_entity
    end
  end

  def destroy
    resume = Resume.find(params[:id])
    if resume.destroy
      render json: {status: 'SUCCESS', message: 'Saved resume', data: resume}, status: :ok
    else
      render json: {status: 'ERROR', message: 'Saved resume', data: resume}, status: :ok
    end
  end

  def update
    @resume = Resume.find(params[:id])
    if @resume.update(resume_params)
      redirect_to @resume
    else
      render 'edit'
    end
  end

  private

  def resume_params
    params.permit(:name, :role, :contact_number, :email, :about, :image, :location, :country)
  end
end
