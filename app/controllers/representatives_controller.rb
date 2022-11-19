# frozen_string_literal: true

class RepresentativesController < ApplicationController
  before_action :set_representative, only: %i[show]

  def index
    @representatives = Representative.all
  end

  # helper
  def set_representative
    @representative = Representative.find(
      params[:id]
    )
  end

end
