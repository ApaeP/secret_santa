class DrawsController < ApplicationController
  def create
    @draw = Draw.new
    @pool = Pool.find(params[:pool_id])
    @draw.pool = @pool
    @draw.save
    redirect_to pool_path(@pool)
  end

end
