class PartiesController < ApplicationController
  def show
    if params[:id]
      @party = Party.find(params[:id])
    else
      @party = Party.last
    end
    @moves = []
    @party.moves.each do |move|
      @moves << move.cell_id
    end
    if win?(@moves)
      @text = "Bravo, tu as gagné!"
    end
  end

  def create
    @party = Party.new(user: current_user)
    if @party.save
      redirect_to party_path(@party)
    else
      render "parties/show"
    end
  end

  private
  def win?(moves)
    return true if moves.select { |n| [1,2,3].include?(n)}.length == 3
    return true if moves.select { |n| [1,5,9].include?(n)}.length == 3
    return true if moves.select { |n| [1,4,7].include?(n)}.length == 3
    return true if moves.select { |n| [2,5,8].include?(n)}.length == 3
    return true if moves.select { |n| [3,5,7].include?(n)}.length == 3
    return true if moves.select { |n| [3,6,9].include?(n)}.length == 3
    return true if moves.select { |n| [4,5,6].include?(n)}.length == 3
    return true if moves.select { |n| [7,8,9].include?(n)}.length == 3
  end
end
