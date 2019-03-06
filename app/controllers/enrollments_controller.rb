class EnrollmentsController < ApplicationController
  before_action :set_course #want enrollments to show on courses page
  #know through rake routes will need course id

  #anytime call enrollments first requiring parent of course

  def index
    @teacher = @course.enrollments.where(role: 'teacher')
    @ta = @course.enrollments.where(role: 'ta')
    @student = @course.enrollments.where(role: 'student')
    #viewing all enrollments by role
    #instead of @enrollments =@course.enrollments
  end

  def new
    @users = User.all - @course.users #- allows us to have 2 params
    @enrollment = @course.enrollments.new
  end

  def create
    @enrollment = @course.enrollments.new(enrollment_params)
    if @enrollment.save
      redirect_to course_enrollments_path(@course)
    else
      render :new
    end
  end

  def destroy
    @enrollment = @course.enrollment.find(params[:id])
    @enrollment.destroy
    redirect_to course_enrollments_path(@course)
  end

private
  def set_course #finds course id
    @course = Course.find(params[:course_id])
  end

  def enrollment_params
    params.require(:enrollment).permit(:role, :user_id)
    #enrollment has a role and we are rquiring user_id
  end
end
