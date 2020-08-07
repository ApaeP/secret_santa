class ParticipantsController < ApplicationController

  def new
    @participant = Participant.new
  end

  def create
    @pool = Pool.find(params[:pool_id])
    @participant = Participant.new(participant_params)
    @participant.pool = @pool
    @participant.save
    redirect_to pool_path(@pool)
  end

  private

  def participant_params
    params.require(:participant).permit(:first_name, :last_name, :email, :companion_id)
  end
end
