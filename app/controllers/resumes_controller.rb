# frozen_string_literal: true

class ResumesController < ApplicationController
  def index
    @resumes = Resume.all
  end

  def show
    @resume = Resume.find(params[:id])
  end

  def new
    @resume = Resume.new
  end

  def edit
    @resume = Resume.find(params[:id])
  end

  def create
    @resume = Resume.new(resume_params)
    if @resume.save
      redirect_to @resume
    else
      render 'new'
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
    params.require(:resume).permit(:name, :role, :contact_number, :email, :about, :image)
  end
end
