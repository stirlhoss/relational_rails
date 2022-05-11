class CoursesController < ApplicationController
  def index
    @course = Course.all
  end

  def new; end

end
