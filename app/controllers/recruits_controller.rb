class RecruitsController < ApplicationController
  before_action :set_recruit, only: [:show, :edit, :update, :destroy, :delete_with_pass]
  before_action :set_tag

  def index
    @recruits = Recruit.includes(:tags).order("created_at DESC")
  end

  def new
    @recruit = RecruitsTag.new
  end

  def create
    @recruit = RecruitsTag.new(recruits_tag_params)
    if @recruit.valid?
      @recruit.save
      return redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @recruit && @recruit.authenticate(params[:recruit][:password]) 
      @recruit.update(recruit_params)
      redirect_to recruit_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    if @recruit && @recruit.authenticate(params[:recruit][:password])
      @recruit.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def search
    @recruits = if params[:tag_id].present?
                  Tag.find(params[:tag_id]).recruits.order("created_at DESC")
                else
                  Recruit.search(params[:keyword])
                end
  end

  private

  def set_recruit
    @recruit = Recruit.find(params[:id])
  end

  def set_tag
    @tags = Tag.all 
  end

  def recruit_params
    params.require(:recruit).permit(:name, :contact_id, :player_name, :style_id, :sex_id, :text, :password)
  end

  def recruits_tag_params
    params.require(:recruits_tag).permit(:name, :contact_id, :player_name, :style_id, :sex_id, :text, :password, :tag_name)
  end
end
