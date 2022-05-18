class HolesController < ApplicationController
  def index
    @holes = Hole.all
  end

  def show
    @hole = Hole.find(params[:id])
  end

  def edit
    @hole = Hole.find(params[:id])
  end

  def update
    hole = Hole.find(params[:id])
    hole.update(hole_params)
    redirect_to "/holes/#{hole.id}"
  end

  private

  def hole_params
    params.permit(:name,
                  :par,
                  :distance_to_pin,
                  :permanent)
  end
end
