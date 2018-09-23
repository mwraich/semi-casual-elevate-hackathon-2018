class ProgramsController < ApplicationController
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
    scope = Program.default_scoped

    scope = scope.search(params[:q]) if params[:q].present?
    scope = scope.search_location(params[:location]) if params[:location].present?

    scope
  end
end
