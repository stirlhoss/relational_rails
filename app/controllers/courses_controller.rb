class CoursesController < ApplicationController
  def index
    @course = Course.all
  end

  def new; end

  def create
    'byebug'
    course = Course.new({
                          name: params[:name][:title]})
  end
end
