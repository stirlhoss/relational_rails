class CoursesController < ApplicationController
  def index
    @courses = Course.order_by_recently_created
  end

  def show
    @course = Course.find(params[:id])
  end

  def new; end
end
