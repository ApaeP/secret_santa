class PoolsController < ApplicationController

  def show
    @pool = Pool.find(params[:id])
  end

  def new
    @pool = Pool.new(user: current_user)
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
