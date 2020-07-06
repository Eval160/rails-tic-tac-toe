class MovesController < ApplicationController
  def create
    @party = Party.find(params[:party_id])
    @move = Move.new(party: @party, cell_id: params[:cell_id])
    if @move.save
      redirect_to party_path(@party)
    else
      render "parties/show"
    end
  end
end
