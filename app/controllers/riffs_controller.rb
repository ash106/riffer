class RiffsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_riff, only: [:show, :edit, :update, :destroy]

  def index
    @riffs = Riff.all
  end

  def show
  end

  def new
    @riff = Riff.new
  end

  def create
    @riff = Riff.new(riff_params)
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
end
