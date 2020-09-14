class RecruitsController < ApplicationController
  def index
    @recruits = Recruit.all
  end

  private

  def set_recruit
    @recruit = Recruit.find(params[:id])
  end

  def recruit_params
    params.require(:recruit).permit(:name, :contact_id, :player_name, :style_id, :sex_id, :text, :password)
  end

end
