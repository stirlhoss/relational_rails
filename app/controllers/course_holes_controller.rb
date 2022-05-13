class CourseHolesController < ApplicationController
  def index
    @course = Course.find(params[:parent_id])
  end
end
