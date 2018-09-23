class EventsController < ApplicationController
  def index
    render json: find_programs.as_json(
      only: [
        :title,
        :description,
        :branch_name
      ]
    )
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
