class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def test

  end

  def inject_model
    @pool = Pool.find(params[:pool_id])
    @participants = @pool.participants
    @participant = Participant.find(params[:participant_id])
    respond_to do |format|
      format.html
      format.js
    end
  end
end
