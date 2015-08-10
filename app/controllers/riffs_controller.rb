class RiffsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_riff, only: [:show, :edit, :update, :destroy]
  before_action :owned_riff, only: [:edit, :update, :destroy]

  def index
    @riffs = Riff.most_recent
  end

  def show
  end

  def new
    @riff = current_user.riffs.build
  end

  def create
    @riff = current_user.riffs.build(riff_params)
    if @riff.save
      redirect_to riffs_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @riff.update(riff_params)
      redirect_to @riff
    else
      render :edit
    end
  end

  def destroy
    @riff.destroy
    redirect_to riffs_url
  end

  private

    def riff_params
      params.require(:riff).permit(:audio, :description)
    end

    def set_riff
      @riff = Riff.find(params[:id])
    end

    def owned_riff
      unless current_user == @riff.user
        flash[:alert] = "That riff doesn't belong to you!"
        redirect_to root_path
      end
    end
end
