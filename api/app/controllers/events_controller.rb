class EventsController < ApplicationController
  def index
    render json: find_programs
  end

  private

  def find_programs
    if params[:q]
      Program.search(params[:q])
    else
      Program.all
    end
  end
end
