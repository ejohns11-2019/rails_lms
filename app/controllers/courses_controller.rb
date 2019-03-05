class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :destroy]

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
      if @course.save
        redirect_to @course
      else
        render :new
      end
  end

  def show
  end

  def destroy
    @course.destroy
    redirect_to courses_path
  end

  private
    def course_params
      params.require(:course).permit(:name)
    end

    def set_course
      @course = Course.find(params[:id])
    end
end
