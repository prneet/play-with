class RecruitsController < ApplicationController
  def index
    @recruits = Recruit.all.order("created_at DESC")
  end

  def new
  end

  def create
  end

  def show
  end

  private

  def set_recruit
    @recruit = Recruit.find(params[:id])
  end

  def recruit_params
    params.require(:recruit).permit(:name, :contact_id, :player_name, :style_id, :sex_id, :text, :password)
  end

end
