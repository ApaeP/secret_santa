class ParticipantsController < ApplicationController
  before_action :set_participant, only: [:edit, :update, :destroy]

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

  def edit
    @participant = Participant.find(params[:id])
  end

  def update
    @participant = Participant.find(params[:id])
    @participant.update(participant_params)
    redirect_to pool_path(@participant.pool)
  end

  def destroy
    @participant = Participant.find(params[:id])
    pool = @participant.pool
    @participant.destroy
    redirect_to pool_path(pool)
  end

  private

  def set_participant
    @participant = Participant.find(params[:id])
  end

  def participant_params
    params.require(:participant).permit(:first_name, :last_name, :email, :companion_id)
  end
end
