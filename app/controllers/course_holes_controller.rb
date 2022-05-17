class CourseHolesController < ApplicationController
  def index
    @course = Course.find(params[:parent_id])
  end

  def new
    @course = Course.find(params[:parent_id])
  end

  def create
    hole = Hole.create(hole_params)
    redirect_to "/courses/#{hole.course_id}/holes"

  end

  private

  def hole_params
    params.permit(:name,
                  :par,
                  :distance_to_pin,
                  :permanent,
                  :course_id)

  end
end
