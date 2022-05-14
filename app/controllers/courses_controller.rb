class CoursesController < ApplicationController
  def index
    @courses = Course.all.order(created_at: :desc)
  end

  def show
    @course = Course.find(params[:id])
  end

  def new; end

end
