class CoursesController < ApplicationController
  def index
    @courses = Course.order_by_recently_created
  end

  def show
    @course = Course.find(params[:id])
  end

  def new; end

  def create
    course = Course.create(name: params[:name], par: params[:par], difficulty: params[:difficulty], permanent: params[:permanent])
    redirect_to "/courses"
  end
end
