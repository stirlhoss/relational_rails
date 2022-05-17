class CoursesController < ApplicationController
  def index
    @courses = Course.order_by_recently_created
  end

  def show
    @course = Course.find(params[:id])
  end

  def new; end

  def create
    course = Course.create(course_params)
    redirect_to "/courses"
  end

  def course_params
    params.permit(:name,
                  :par,
                  :difficulty,
                  :permanent
                 )
  end
end
