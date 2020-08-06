class PoolsController < ApplicationController

  def show
    @participant = Participant.new
    @pool = Pool.find(params[:id])
    @participants = Participant.where(pool: @pool)
  end

  def new
    @pool = Pool.new
  end

  def create
    @pool = Pool.new(pool_params)
    @pool.user = current_user
    @pool.save!
    redirect_to root_path
  end

  private

  def pool_params
    params.require(:pool).permit(:name)
  end
end
