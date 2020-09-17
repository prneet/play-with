class RecruitsController < ApplicationController
  before_action :set_recruit, only: [:show, :edit, :update, :destroy]
  def index
    @recruits = Recruit.all.order("created_at DESC")
  end

  def new
    @recruit = Recruit.new
  end

  def create
    @recruit = Recruit.new(recruit_params)
    if @recruit.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @recruit.update(recruit_params)
      redirect_to recruit_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    if @recruit.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def set_recruit
    @recruit = Recruit.find(params[:id])
  end

  def recruit_params
    params.require(:recruit).permit(:name, :contact_id, :player_name, :style_id, :sex_id, :text, :password)
  end
end
