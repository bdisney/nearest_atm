class AtmsController < ApplicationController
  def new
    @atm = Atm.new
  end

  def index; end

  def create
    @atm = Atm.new(atm_params)
    @atm.build_location(location_params)

    if @atm.save
      redirect_to home_path, notice: t('activerecord.notices.atm_cteated')
    else
      render :new
    end
  end

  private

  def atm_params
    params.require(:atm).permit(:id, :address)
  end

  def location_params
    params.require(:atm).require(:location).permit(:latitude, :longitude)
  end
end
